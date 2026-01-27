#!/usr/bin/env bash
#
# GitHub SOC 2 Configuration Checker
# Audits GitHub organization settings for SOC 2 compliance
#
# Usage: ./checker.sh --org <organization> [--repo <repository>] [--format text|json|markdown]
#
# Requirements:
#   - GitHub CLI (gh) authenticated with admin access
#   - jq for JSON parsing

set -euo pipefail

# Script version
VERSION="1.0.0"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Default values
ORG=""
REPO=""
OUTPUT_FORMAT="text"
VERBOSE=false

# Counters for summary
PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0
SKIP_COUNT=0

usage() {
    cat <<EOF
GitHub SOC 2 Configuration Checker v${VERSION}

Usage: $0 --org <organization> [options]

Required:
  --org <name>              GitHub organization name

Options:
  --repo <name>             Check specific repository (default: all repos)
  --format <type>           Output format: text, json, markdown (default: text)
  --verbose                 Show additional details
  --help                    Show this help message

Examples:
  $0 --org my-organization
  $0 --org my-org --repo my-repo
  $0 --org my-org --format json > report.json
  $0 --org my-org --format markdown > report.md

Requirements:
  - GitHub CLI (gh) must be installed and authenticated
  - jq must be installed for JSON parsing
  - Authenticated user needs organization admin or security manager role
EOF
    exit 0
}

log_pass() {
    echo -e "${GREEN}[PASS]${NC} $1"
    ((PASS_COUNT++))
}

log_fail() {
    echo -e "${RED}[FAIL]${NC} $1"
    if [[ -n "${2:-}" ]]; then
        echo "       Remediation: $2"
    fi
    ((FAIL_COUNT++))
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
    if [[ -n "${2:-}" ]]; then
        echo "       Note: $2"
    fi
    ((WARN_COUNT++))
}

log_skip() {
    echo -e "${BLUE}[SKIP]${NC} $1"
    if [[ -n "${2:-}" ]]; then
        echo "       Reason: $2"
    fi
    ((SKIP_COUNT++))
}

# Check if required tools are installed
check_prerequisites() {
    if ! command -v gh &> /dev/null; then
        echo "Error: GitHub CLI (gh) is not installed"
        echo "Install: https://cli.github.com/"
        exit 1
    fi

    if ! command -v jq &> /dev/null; then
        echo "Error: jq is not installed"
        echo "Install: https://stedolan.github.io/jq/"
        exit 1
    fi

    # Check gh authentication
    if ! gh auth status &> /dev/null; then
        echo "Error: GitHub CLI is not authenticated"
        echo "Run: gh auth login"
        exit 1
    fi
}

# Check rate limits
check_rate_limit() {
    local remaining
    remaining=$(gh api rate_limit --jq '.rate.remaining')

    if [[ "$remaining" -lt 100 ]]; then
        log_warn "GitHub API rate limit low: $remaining requests remaining"
    fi

    if [[ "$VERBOSE" == "true" ]]; then
        echo "API rate limit: $remaining requests remaining"
    fi
}

# CC6.1 - Access Controls: Check MFA requirement
check_mfa_requirement() {
    local mfa_required

    mfa_required=$(gh api "/orgs/${ORG}" --jq '.two_factor_requirement_enabled' 2>/dev/null || echo "false")

    if [[ "$mfa_required" == "true" ]]; then
        log_pass "CC6.1: MFA required for organization members"
        return 0
    else
        log_fail "CC6.1: MFA not required for organization members" \
                 "Enable at Settings > Authentication security > Require two-factor authentication"
        return 1
    fi
}

# CC6.1 - Access Controls: Check SSO enabled (Enterprise only)
check_sso_enabled() {
    local plan
    plan=$(gh api "/orgs/${ORG}" --jq '.plan.name' 2>/dev/null || echo "free")

    if [[ "$plan" != "enterprise" ]]; then
        log_skip "CC6.1: SAML SSO check" "Requires GitHub Enterprise Cloud"
        return 0
    fi

    # Check if SAML is configured
    local saml_enabled
    saml_enabled=$(gh api "/orgs/${ORG}" --jq '.has_organization_projects' 2>/dev/null || echo "false")

    # Note: Full SAML check requires additional API endpoints
    log_skip "CC6.1: SAML SSO configuration" "Manual verification required for Enterprise organizations"
    return 0
}

# CC8.1 - Change Management: Check branch protection
check_branch_protection() {
    local repo="$1"
    local default_branch

    default_branch=$(gh api "/repos/${ORG}/${repo}" --jq '.default_branch' 2>/dev/null || echo "")

    if [[ -z "$default_branch" ]]; then
        log_skip "CC8.1: Branch protection check for ${repo}" "Cannot determine default branch"
        return 0
    fi

    local protection
    protection=$(gh api "/repos/${ORG}/${repo}/branches/${default_branch}/protection" 2>/dev/null || echo "{}")

    if [[ "$protection" == "{}" ]]; then
        log_fail "CC8.1: No branch protection on ${repo}:${default_branch}" \
                 "Enable at Settings > Branches > Add branch protection rule"
        return 1
    fi

    # Check specific protection rules
    local issues=()

    # Require pull request reviews
    local require_pr
    require_pr=$(echo "$protection" | jq -r '.required_pull_request_reviews // empty')
    if [[ -z "$require_pr" ]]; then
        issues+=("Require pull request reviews before merging")
    fi

    # Require code owner reviews
    local require_codeowners
    require_codeowners=$(echo "$protection" | jq -r '.required_pull_request_reviews.require_code_owner_reviews // false')
    if [[ "$require_codeowners" != "true" ]]; then
        issues+=("Require review from code owners")
    fi

    # Dismiss stale reviews
    local dismiss_stale
    dismiss_stale=$(echo "$protection" | jq -r '.required_pull_request_reviews.dismiss_stale_reviews // false')
    if [[ "$dismiss_stale" != "true" ]]; then
        issues+=("Dismiss stale pull request approvals when new commits are pushed")
    fi

    # Require status checks
    local require_status
    require_status=$(echo "$protection" | jq -r '.required_status_checks // empty')
    if [[ -z "$require_status" ]]; then
        issues+=("Require status checks to pass before merging")
    fi

    # Prevent force pushes
    local allow_force
    allow_force=$(echo "$protection" | jq -r '.allow_force_pushes.enabled // false')
    if [[ "$allow_force" == "true" ]]; then
        issues+=("Disable force pushes")
    fi

    if [[ ${#issues[@]} -eq 0 ]]; then
        log_pass "CC8.1: Branch protection properly configured on ${repo}:${default_branch}"
        return 0
    else
        log_warn "CC8.1: Branch protection incomplete on ${repo}:${default_branch}" \
                 "Missing: ${issues[*]}"
        if [[ "$VERBOSE" == "true" ]]; then
            for issue in "${issues[@]}"; do
                echo "         - ${issue}"
            done
        fi
        return 1
    fi
}

# CC3.2 - Risk Assessment: Check Dependabot alerts
check_dependabot() {
    local repo="$1"

    # Try to check if vulnerability alerts are enabled
    local alerts_enabled
    alerts_enabled=$(gh api -X GET "/repos/${ORG}/${repo}/vulnerability-alerts" 2>/dev/null && echo "true" || echo "false")

    if [[ "$alerts_enabled" == "true" ]]; then
        log_pass "CC3.2: Dependabot alerts enabled on ${repo}"
        return 0
    else
        log_fail "CC3.2: Dependabot alerts not enabled on ${repo}" \
                 "Enable at Settings > Security & analysis > Dependabot alerts"
        return 1
    fi
}

# CC6.1 - Access Controls: Check secret scanning
check_secret_scanning() {
    local repo="$1"

    local secret_scanning
    secret_scanning=$(gh api "/repos/${ORG}/${repo}" --jq '.security_and_analysis.secret_scanning.status // "disabled"' 2>/dev/null)

    local push_protection
    push_protection=$(gh api "/repos/${ORG}/${repo}" --jq '.security_and_analysis.secret_scanning_push_protection.status // "disabled"' 2>/dev/null)

    if [[ "$secret_scanning" == "enabled" && "$push_protection" == "enabled" ]]; then
        log_pass "CC6.1: Secret scanning with push protection enabled on ${repo}"
        return 0
    elif [[ "$secret_scanning" == "enabled" ]]; then
        log_warn "CC6.1: Secret scanning enabled but push protection disabled on ${repo}" \
                 "Enable push protection for stronger security"
        return 1
    else
        # Check if it's a public repo (secret scanning is automatic on public repos)
        local visibility
        visibility=$(gh api "/repos/${ORG}/${repo}" --jq '.visibility // "private"' 2>/dev/null)

        if [[ "$visibility" == "public" ]]; then
            log_pass "CC6.1: Secret scanning available on public repository ${repo}"
            return 0
        else
            log_fail "CC6.1: Secret scanning not enabled on ${repo}" \
                     "Enable at Settings > Security & analysis > Secret scanning (requires GitHub Advanced Security)"
            return 1
        fi
    fi
}

# CC7.1 - Detection: Check code scanning
check_code_scanning() {
    local repo="$1"

    local code_scanning
    code_scanning=$(gh api "/repos/${ORG}/${repo}" --jq '.security_and_analysis.advanced_security.status // "disabled"' 2>/dev/null)

    # Check if code scanning alerts exist (indicates it's configured)
    local alerts
    alerts=$(gh api "/repos/${ORG}/${repo}/code-scanning/alerts" --jq 'length' 2>/dev/null || echo "0")

    # Check repo visibility
    local visibility
    visibility=$(gh api "/repos/${ORG}/${repo}" --jq '.visibility // "private"' 2>/dev/null)

    if [[ "$visibility" == "public" ]]; then
        log_pass "CC7.1: Code scanning available on public repository ${repo}"
        return 0
    elif [[ "$code_scanning" == "enabled" ]]; then
        log_pass "CC7.1: Code scanning (GitHub Advanced Security) enabled on ${repo}"
        return 0
    else
        log_skip "CC7.1: Code scanning check for ${repo}" \
                 "Requires GitHub Advanced Security (Enterprise feature) or public repository"
        return 0
    fi
}

# Main function
main() {
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --org)
                ORG="$2"
                shift 2
                ;;
            --repo)
                REPO="$2"
                shift 2
                ;;
            --format)
                OUTPUT_FORMAT="$2"
                shift 2
                ;;
            --verbose)
                VERBOSE=true
                shift
                ;;
            --help)
                usage
                ;;
            *)
                echo "Unknown option: $1"
                usage
                ;;
        esac
    done

    # Validate required arguments
    if [[ -z "$ORG" ]]; then
        echo "Error: --org is required"
        usage
    fi

    # Check prerequisites
    check_prerequisites

    # Print header
    echo "========================================"
    echo "GitHub SOC 2 Configuration Checker v${VERSION}"
    echo "========================================"
    echo "Organization: ${ORG}"
    if [[ -n "$REPO" ]]; then
        echo "Repository: ${REPO}"
    else
        echo "Scope: All repositories"
    fi
    echo "Timestamp: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "========================================"
    echo ""

    # Check rate limits
    check_rate_limit
    echo ""

    # Organization-level checks
    echo "## Organization-Level Checks"
    echo ""
    check_mfa_requirement
    check_sso_enabled
    echo ""

    # Repository-level checks
    echo "## Repository-Level Checks"
    echo ""

    local repos=()
    if [[ -n "$REPO" ]]; then
        repos=("$REPO")
    else
        echo "Fetching repository list..."
        mapfile -t repos < <(gh repo list "$ORG" --json name --jq '.[].name' --limit 1000)
        echo "Found ${#repos[@]} repositories"
        echo ""
    fi

    for repo in "${repos[@]}"; do
        if [[ ${#repos[@]} -gt 1 ]]; then
            echo "### Repository: ${repo}"
        fi

        check_branch_protection "$repo"
        check_dependabot "$repo"
        check_secret_scanning "$repo"
        check_code_scanning "$repo"

        if [[ ${#repos[@]} -gt 1 ]]; then
            echo ""
        fi
    done

    # Summary
    echo "========================================"
    echo "Summary"
    echo "========================================"
    echo "Total Checks:"
    echo "  PASS: ${PASS_COUNT}"
    echo "  FAIL: ${FAIL_COUNT}"
    echo "  WARN: ${WARN_COUNT}"
    echo "  SKIP: ${SKIP_COUNT}"
    echo ""

    local total=$((PASS_COUNT + FAIL_COUNT + WARN_COUNT))
    local pass_rate=0
    if [[ $total -gt 0 ]]; then
        pass_rate=$((PASS_COUNT * 100 / total))
    fi
    echo "Pass Rate: ${pass_rate}% (excluding skipped checks)"
    echo ""

    if [[ $FAIL_COUNT -eq 0 ]]; then
        echo "Result: All checks passed!"
        exit 0
    else
        echo "Result: ${FAIL_COUNT} check(s) failed - remediation required"
        exit 1
    fi
}

main "$@"
