#!/usr/bin/env bash
#
# Policy Template Generator
# Generates customized policy documents from templates
#
# Usage: ./generator.sh --template <template.md> --vars <variables.yaml> --output <output.md>
#        ./generator.sh --template <template.md> --interactive --output <output.md>
#
# Requirements:
#   - Bash 5.x
#   - yq (mikefarah version) for YAML parsing

set -euo pipefail

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default values
TEMPLATE=""
VARS_FILE=""
OUTPUT=""
INTERACTIVE=false
KEEP_FRONTMATTER=false

usage() {
    cat <<EOF
Policy Template Generator

Generates customized policy documents from templates by replacing {{VARIABLE}}
placeholders with values from a YAML file or interactive prompts.

Usage:
    $0 --template <template.md> --vars <variables.yaml> --output <output.md>
    $0 --template <template.md> --interactive --output <output.md>

Options:
    --template FILE         Path to template file (required)
    --vars FILE            Path to variables YAML file (required unless --interactive)
    --output FILE          Output file path (required)
    --interactive          Interactive mode - prompt for each variable
    --keep-frontmatter     Don't strip YAML frontmatter from output
    --help                 Show this help message

Examples:
    # Using variables file
    $0 --template ../../templates/ai-acceptable-use-policy.md \\
       --vars my-vars.yaml --output my-policy.md

    # Interactive mode
    $0 --template ../../templates/ai-acceptable-use-policy.md \\
       --interactive --output my-policy.md

Prerequisites:
    - yq (mikefarah version): https://github.com/mikefarah/yq
      Install: brew install yq (macOS) or see docs for other platforms
EOF
    exit 1
}

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check prerequisites
check_dependencies() {
    if ! command -v yq &> /dev/null; then
        log_error "yq (mikefarah version) is not installed"
        echo "Install: brew install yq (macOS) or visit https://github.com/mikefarah/yq"
        exit 1
    fi

    # Verify it's the mikefarah version (has --version flag)
    if ! yq --version &> /dev/null; then
        log_error "Detected yq but it's not the mikefarah version"
        echo "Required: https://github.com/mikefarah/yq"
        exit 1
    fi
}

# Extract all {{VARIABLE}} patterns from template
extract_variables() {
    local template="$1"

    # Find all {{VARIABLE}} patterns, remove duplicates, and strip braces
    grep -oE '\{\{[A-Z_0-9]+\}\}' "$template" 2>/dev/null | sort -u | sed 's/[{}]//g' || true
}

# Get variable metadata from template frontmatter
get_variable_metadata() {
    local template="$1"
    local var="$2"

    # Extract description
    local description
    description=$(yq eval ".variables[] | select(.name == \"$var\") | .description // \"\"" "$template" 2>/dev/null || echo "")

    # Extract example
    local example
    example=$(yq eval ".variables[] | select(.name == \"$var\") | .example // \"\"" "$template" 2>/dev/null || echo "")

    # Extract required flag
    local required
    required=$(yq eval ".variables[] | select(.name == \"$var\") | .required // false" "$template" 2>/dev/null || echo "false")

    echo "${description}|${example}|${required}"
}

# Replace variables using values from YAML file
replace_variables() {
    local template="$1"
    local vars_file="$2"
    local content

    content=$(cat "$template")

    # Read each variable and replace in template
    while IFS= read -r var; do
        if [[ -z "$var" ]]; then
            continue
        fi

        local value
        value=$(yq eval ".${var} // \"\"" "$vars_file" 2>/dev/null || echo "")

        if [[ -n "$value" ]]; then
            # Replace all occurrences of {{VARIABLE}} with the value
            content="${content//\{\{${var}\}\}/${value}}"
            log_info "Replaced {{${var}}}"
        else
            log_warn "No value found for {{${var}}} in variables file"
        fi
    done < <(extract_variables "$template")

    echo "$content"
}

# Interactive mode - prompt for each variable
interactive_replace() {
    local template="$1"
    local content

    content=$(cat "$template")

    log_info "Interactive mode - enter values for each variable"
    echo ""

    while IFS= read -r var; do
        if [[ -z "$var" ]]; then
            continue
        fi

        # Get metadata from frontmatter
        local metadata
        metadata=$(get_variable_metadata "$template" "$var")

        IFS='|' read -r description example required <<< "$metadata"

        # Display variable information
        echo "Variable: ${var}"
        if [[ -n "$description" ]]; then
            echo "  Description: ${description}"
        fi
        if [[ "$required" == "true" ]]; then
            echo "  Required: YES"
        fi

        # Prompt for value
        local value
        if [[ -n "$example" ]]; then
            read -rp "  Value [${example}]: " value
            value="${value:-$example}"
        else
            read -rp "  Value: " value
        fi

        # Validate required variables
        if [[ "$required" == "true" && -z "$value" ]]; then
            log_error "Required variable cannot be empty: ${var}"
            exit 1
        fi

        # Replace in content
        content="${content//\{\{${var}\}\}/${value}}"
        echo ""
    done < <(extract_variables "$template")

    echo "$content"
}

# Strip YAML frontmatter from output
strip_frontmatter() {
    # Remove everything from first --- to second --- (inclusive)
    sed '1 { /^---/ { :a N; /\n---/! ba; d} }'
}

# Validate template file
validate_template() {
    local template="$1"

    if [[ ! -f "$template" ]]; then
        log_error "Template file not found: $template"
        exit 1
    fi

    # Check if file has content
    if [[ ! -s "$template" ]]; then
        log_error "Template file is empty: $template"
        exit 1
    fi

    log_info "Template validated: $template"
}

# Validate output has no remaining unreplaced variables
validate_output() {
    local output_file="$1"

    # Check for any remaining {{VARIABLE}} patterns
    local remaining
    remaining=$(grep -oE '\{\{[A-Z_0-9]+\}\}' "$output_file" 2>/dev/null | sort -u || true)

    if [[ -n "$remaining" ]]; then
        echo ""
        log_warn "The following variables were not replaced:"
        echo "$remaining" | while IFS= read -r var; do
            echo "  - $var"
        done
        echo ""
        echo "These will appear as {{VARIABLE}} in the output document."
        echo "Review your variables file or provide values for these variables."
        return 1
    fi

    return 0
}

main() {
    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --template)
                TEMPLATE="$2"
                shift 2
                ;;
            --vars)
                VARS_FILE="$2"
                shift 2
                ;;
            --output)
                OUTPUT="$2"
                shift 2
                ;;
            --interactive)
                INTERACTIVE=true
                shift
                ;;
            --keep-frontmatter)
                KEEP_FRONTMATTER=true
                shift
                ;;
            --help)
                usage
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                ;;
        esac
    done

    # Validate required arguments
    if [[ -z "$TEMPLATE" || -z "$OUTPUT" ]]; then
        log_error "Missing required arguments"
        usage
    fi

    # Check dependencies
    check_dependencies

    # Validate template
    validate_template "$TEMPLATE"

    # Process template
    local result
    if [[ "$INTERACTIVE" == "true" ]]; then
        log_info "Starting interactive mode"
        result=$(interactive_replace "$TEMPLATE")
    else
        # Non-interactive mode requires variables file
        if [[ -z "$VARS_FILE" ]]; then
            log_error "Variables file required in non-interactive mode: --vars <file.yaml>"
            usage
        fi

        if [[ ! -f "$VARS_FILE" ]]; then
            log_error "Variables file not found: $VARS_FILE"
            exit 1
        fi

        log_info "Using variables from: $VARS_FILE"
        result=$(replace_variables "$TEMPLATE" "$VARS_FILE")
    fi

    # Strip frontmatter unless explicitly kept
    if [[ "$KEEP_FRONTMATTER" == "false" ]]; then
        result=$(echo "$result" | strip_frontmatter)
    fi

    # Write output
    echo "$result" > "$OUTPUT"

    log_info "Generated: $OUTPUT"

    # Validate output
    validate_output "$OUTPUT" || true

    echo ""
    log_info "Template generation complete!"
}

main "$@"
