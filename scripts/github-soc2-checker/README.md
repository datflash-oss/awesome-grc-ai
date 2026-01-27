# GitHub SOC 2 Configuration Checker

Automated script that audits GitHub organization and repository security settings against SOC 2 requirements, producing a compliance report with pass/fail status and remediation guidance.

## SOC 2 Control Mapping

This script checks GitHub configurations against the following SOC 2 Trust Services Criteria:

| Check | SOC 2 Control | Description | Tier |
|-------|---------------|-------------|------|
| **MFA Required** | CC6.1 | Logical access controls - multi-factor authentication required for all organization members | All |
| **SSO Enabled** | CC6.1 | Centralized identity management via SAML single sign-on | Enterprise |
| **Branch Protection** | CC8.1 | Change management controls - require reviews, prevent force pushes, enforce status checks | All |
| **Dependabot Alerts** | CC3.2 | Risk assessment - vulnerability detection and tracking for dependencies | All |
| **Secret Scanning** | CC6.1 | Credential protection - detect and prevent credential leaks | All* |
| **Code Scanning** | CC7.1 | Security detection - static analysis for security vulnerabilities | Enterprise** |

**Tier Legend:**
- **All**: Available on GitHub Free, Team, Enterprise Cloud, and Enterprise Server
- **Enterprise**: Requires GitHub Enterprise Cloud or Enterprise Server
- **All***: Secret scanning enabled automatically on public repos; requires GitHub Advanced Security for private repos
- **Enterprise**: Code scanning available on public repos; requires GitHub Advanced Security for private repos

## Prerequisites

Before running the checker, ensure you have:

1. **GitHub CLI (`gh`)** installed and authenticated with admin access
2. **Organization permissions**: Organization admin or security manager role
3. **jq** installed for JSON parsing

### Installation

#### macOS

```bash
# Install GitHub CLI
brew install gh

# Install jq
brew install jq

# Authenticate with GitHub
gh auth login
```

#### Linux

```bash
# Install GitHub CLI
# Debian/Ubuntu
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Install jq
sudo apt-get install jq

# Authenticate with GitHub
gh auth login
```

#### Verify Installation

```bash
# Check GitHub CLI
gh --version

# Check jq
jq --version

# Verify authentication
gh auth status
```

## Usage

### Basic Usage

Check all repositories in an organization:

```bash
./checker.sh --org my-organization
```

### Single Repository

Check a specific repository:

```bash
./checker.sh --org my-org --repo my-repo
```

### Output Formats

Generate reports in different formats:

```bash
# Text output (default) - human-readable colored output
./checker.sh --org my-org

# JSON output - machine-readable for processing
./checker.sh --org my-org --format json > report.json

# Markdown output - for documentation and audit reports
./checker.sh --org my-org --format markdown > report.md
```

### Verbose Mode

Show additional details for troubleshooting:

```bash
./checker.sh --org my-org --verbose
```

### Complete Example

```bash
# Make script executable
chmod +x checker.sh

# Run comprehensive check with verbose output
./checker.sh --org awesome-grc-ai --verbose

# Save results for audit
./checker.sh --org awesome-grc-ai --format markdown > audit-report-$(date +%Y-%m-%d).md
```

## Output Formats

### Text Format (Default)

Human-readable output with color-coded results:

- `[PASS]` (green): Check passed
- `[FAIL]` (red): Check failed with remediation guidance
- `[WARN]` (yellow): Partial compliance or advisory
- `[SKIP]` (blue): Check skipped (Enterprise feature unavailable)

Example:

```
========================================
GitHub SOC 2 Configuration Checker v1.0.0
========================================
Organization: my-org
Timestamp: 2026-01-27T12:00:00Z
========================================

## Organization-Level Checks

[PASS] CC6.1: MFA required for organization members
[SKIP] CC6.1: SAML SSO check
       Reason: Requires GitHub Enterprise Cloud

## Repository-Level Checks

### Repository: my-app
[PASS] CC8.1: Branch protection properly configured on my-app:main
[PASS] CC3.2: Dependabot alerts enabled on my-app
[WARN] CC6.1: Secret scanning enabled but push protection disabled on my-app
       Note: Enable push protection for stronger security
[PASS] CC7.1: Code scanning available on public repository my-app

========================================
Summary
========================================
Total Checks:
  PASS: 15
  FAIL: 2
  WARN: 3
  SKIP: 5

Pass Rate: 75% (excluding skipped checks)

Result: 2 check(s) failed - remediation required
```

### JSON Format

Structured data for programmatic processing:

```json
{
  "organization": "my-org",
  "timestamp": "2026-01-27T12:00:00Z",
  "checks": [
    {
      "control": "CC6.1",
      "check": "MFA Required",
      "status": "pass",
      "repository": null
    }
  ],
  "summary": {
    "pass": 15,
    "fail": 2,
    "warn": 3,
    "skip": 5,
    "pass_rate": 75
  }
}
```

### Markdown Format

Documentation-ready format for audit reports:

```markdown
# GitHub SOC 2 Compliance Report

**Organization:** my-org
**Date:** 2026-01-27
**Checker Version:** 1.0.0

## Summary

| Status | Count |
|--------|-------|
| Pass   | 15    |
| Fail   | 2     |
| Warn   | 3     |
| Skip   | 5     |

## Detailed Results

### Organization-Level Checks

- ✅ **CC6.1**: MFA required for organization members
- ⏭️ **CC6.1**: SAML SSO check (Requires GitHub Enterprise Cloud)
```

## GitHub Enterprise Features

### What Checks Require Enterprise?

The following checks require **GitHub Enterprise Cloud** or **GitHub Enterprise Server**:

1. **SAML SSO Configuration** (CC6.1)
   - Centralized authentication with identity provider
   - Automatic user provisioning/deprovisioning
   - On free/Team tier: Check is **skipped** with clear message

2. **Secret Scanning for Private Repos** (CC6.1)
   - Requires GitHub Advanced Security license
   - Public repositories have secret scanning automatically
   - On free/Team tier: Check **fails** for private repos with remediation guidance

3. **Code Scanning** (CC7.1)
   - Requires GitHub Advanced Security license
   - Public repositories can enable for free
   - On free/Team tier: Check is **skipped** for private repos

### What Works on Free/Team Tier?

These checks work on **all GitHub plans**:

- ✅ MFA requirement enforcement
- ✅ Branch protection rules
- ✅ Dependabot alerts
- ✅ Secret scanning (public repos)
- ✅ Code scanning (public repos)

### Graceful Degradation

The script automatically detects your GitHub plan and:

- **Skips** Enterprise-only checks with clear messaging
- **Continues** with all available checks
- **Reports** which features require upgrade
- **Provides** pass rate based only on applicable checks

## Required Permissions

The authenticated GitHub account needs one of the following roles:

### Organization Admin

Full access to all checks:

- ✅ Read organization settings
- ✅ Read repository settings
- ✅ Read security configurations
- ✅ Access to all repositories

### Security Manager (Recommended)

Minimum privilege for security auditing:

- ✅ Read organization security settings
- ✅ Read repository security settings
- ✅ Access to security alerts
- ❌ Cannot modify settings (read-only audit)

### Repository Admin

Limited to repository-level checks only:

- ❌ Cannot check organization-level settings
- ✅ Can check repository branch protection
- ✅ Can check repository security features

## Troubleshooting

### Authentication Errors

**Error:** `Error: GitHub CLI is not authenticated`

**Solution:**
```bash
gh auth login
```

Follow the prompts to authenticate via browser or token.

---

**Error:** `gh: command not found`

**Solution:** Install GitHub CLI:
```bash
# macOS
brew install gh

# Linux
# See installation instructions above
```

### Permission Denied

**Error:** `HTTP 403: Resource not accessible by integration`

**Causes:**
- Insufficient organization permissions
- Token scopes missing required access

**Solution:**
1. Verify your role: Must be organization admin or security manager
2. Re-authenticate with correct scopes:
   ```bash
   gh auth refresh -h github.com -s admin:org
   ```

---

**Error:** `HTTP 404: Not Found`

**Causes:**
- Organization name misspelled
- Repository doesn't exist
- Private repository without access

**Solution:**
1. Verify organization name: `gh org list`
2. Verify repository access: `gh repo list <org>`

### Rate Limiting

**Warning:** `GitHub API rate limit low: 50 requests remaining`

**Explanation:** GitHub API has rate limits:
- Authenticated: 5,000 requests/hour
- Script uses ~5-10 requests per repository

**Solution:**
1. Wait for rate limit to reset (shown in warning)
2. Check fewer repositories at once
3. Use `--repo` to check specific repository

---

**Error:** `API rate limit exceeded`

**Solution:** Wait for rate limit reset:
```bash
gh api rate_limit --jq '.rate.reset' | xargs -I {} date -r {}
```

### Feature Not Available

**Message:** `[SKIP] CC6.1: SAML SSO check - Requires GitHub Enterprise Cloud`

**Explanation:** Your organization is on Free or Team plan. This feature requires upgrade.

**Action:**
- No action needed - check is skipped
- Consider GitHub Enterprise if needed for SOC 2 compliance
- Other checks still provide value

---

**Message:** `[FAIL] CC6.1: Secret scanning not enabled - Requires GitHub Advanced Security`

**Explanation:** Private repository secret scanning requires Enterprise + Advanced Security.

**Options:**
1. Upgrade to GitHub Enterprise Cloud
2. Make repository public (if appropriate)
3. Accept risk and document exception

### jq Errors

**Error:** `jq: command not found`

**Solution:** Install jq:
```bash
# macOS
brew install jq

# Linux
sudo apt-get install jq
```

## Interpreting Results

### Priority Levels

When the checker finds issues, address them in this priority order:

#### High Priority (Fix Immediately)

- **[FAIL] MFA not required**: Critical access control gap
  - SOC 2 auditors expect MFA on all accounts
  - Easy remediation: Organization Settings > Authentication security

- **[FAIL] No branch protection**: Changes can bypass review
  - Violates change management controls (CC8.1)
  - Set up for all production repositories immediately

- **[FAIL] Secret scanning not enabled**: Credentials may leak
  - Direct security vulnerability
  - Enable on all repositories with sensitive code

#### Medium Priority (Fix Soon)

- **[WARN] Branch protection incomplete**: Some controls missing
  - Review specific missing controls
  - Add code owner reviews, status checks, dismiss stale approvals

- **[WARN] Secret scanning without push protection**: Partial protection
  - Secrets detected after push, not prevented
  - Enable push protection to block at commit time

- **[FAIL] Dependabot alerts not enabled**: Missing vulnerability detection
  - No automated security patch notifications
  - Enable to track dependency vulnerabilities

#### Low Priority (Consider)

- **[SKIP] SAML SSO check**: Enterprise feature
  - Evaluate if Enterprise needed for compliance
  - Document compensating controls if not upgrading

- **[SKIP] Code scanning**: Advanced security feature
  - Consider enabling if budget allows
  - Alternative: Use third-party SAST tools

### Pass Rate Thresholds

- **90-100%**: Excellent - ready for SOC 2 audit
- **75-89%**: Good - address failed checks before audit
- **60-74%**: Needs work - significant gaps remain
- **Below 60%**: Critical - major remediation required

### Common Failure Patterns

**Pattern:** All repository checks fail on new organization

**Cause:** Default settings not SOC 2-compliant

**Fix:** Configure organization-wide security settings, then apply to repositories

---

**Pattern:** Public repos pass, private repos fail

**Cause:** Some security features automatic on public, require Advanced Security on private

**Fix:** Evaluate GitHub Advanced Security license or keep sensitive code in compliant repos

---

**Pattern:** Old repos fail, new repos pass

**Cause:** Security settings improved over time, not retroactively applied

**Fix:** Run remediation campaign on legacy repositories

## Remediation Guidance

### Enable MFA Requirement

1. Go to `https://github.com/organizations/<org>/settings/security`
2. Under "Authentication security"
3. Check "Require two-factor authentication for everyone in the organization"
4. Set grace period (e.g., 7 days) for compliance
5. Save settings

**Verification:**
```bash
./checker.sh --org <org> | grep "MFA required"
```

### Configure Branch Protection

1. Go to repository Settings > Branches
2. Click "Add branch protection rule"
3. Branch name pattern: `main` (or your default branch)
4. Enable:
   - ✅ Require a pull request before merging
   - ✅ Require approvals (1+)
   - ✅ Dismiss stale pull request approvals when new commits are pushed
   - ✅ Require review from Code Owners
   - ✅ Require status checks to pass before merging
   - ✅ Do not allow bypassing the above settings
5. Save changes

**Verification:**
```bash
./checker.sh --org <org> --repo <repo> | grep "Branch protection"
```

### Enable Dependabot Alerts

1. Go to repository Settings > Security & analysis
2. Under "Dependabot alerts"
3. Click "Enable"
4. Optionally enable Dependabot security updates for automatic PRs

**Or enable organization-wide:**
1. Go to organization Settings > Security & analysis
2. Enable Dependabot alerts for all repositories

**Verification:**
```bash
./checker.sh --org <org> --repo <repo> | grep "Dependabot"
```

### Enable Secret Scanning

**For public repositories** (automatic):
- Secret scanning is always enabled
- Configure push protection if desired

**For private repositories** (requires Advanced Security):
1. Purchase GitHub Advanced Security license
2. Go to repository Settings > Security & analysis
3. Enable "GitHub Advanced Security"
4. Enable "Secret scanning"
5. Enable "Push protection" (recommended)

**Verification:**
```bash
./checker.sh --org <org> --repo <repo> | grep "Secret scanning"
```

### Resources

- [GitHub Branch Protection Documentation](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches)
- [GitHub Security Features](https://docs.github.com/en/code-security)
- [SOC 2 Compliance Resources](https://docs.github.com/en/organizations/keeping-your-organization-secure)
- [GitHub Enterprise Pricing](https://github.com/pricing)

## Exit Codes

The script exits with the following codes:

- `0`: All checks passed (or only skipped checks)
- `1`: One or more checks failed
- `1`: Prerequisites not met (gh not installed, not authenticated, etc.)

## Support

For issues or questions:

1. Check [GitHub Docs](https://docs.github.com/)
2. Review [SOC 2 Control Mappings](#soc-2-control-mapping)
3. Open an issue in the repository

## License

This script is part of the awesome-grc-ai repository. See repository LICENSE for details.
