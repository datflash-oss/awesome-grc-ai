# Policy Template Generator

Bash script that generates customized policy documents from templates by replacing `{{VARIABLE}}` placeholders with organization-specific values.

## Purpose

Transform generic policy templates into organization-specific documents through variable substitution. Supports both file-based (YAML) and interactive modes for variable replacement.

## Prerequisites

- **Bash 5.x** - Pre-installed on macOS 10.15+ and most Linux distributions
- **yq (mikefarah version)** - YAML processor for parsing variable files

### Installing yq

```bash
# macOS
brew install yq

# Linux (download binary)
wget https://github.com/mikefarah/yq/releases/download/v4.40.5/yq_linux_amd64 -O /usr/local/bin/yq
chmod +x /usr/local/bin/yq

# Verify installation
yq --version
```

**Important:** This script requires the [mikefarah/yq](https://github.com/mikefarah/yq) version, not the older Python-based kislyuk/yq.

## Usage

### Basic Usage with Variables File

```bash
./generator.sh --template <template.md> --vars <variables.yaml> --output <output.md>
```

**Example:**

```bash
./generator.sh \
  --template ../../templates/ai-acceptable-use-policy.md \
  --vars my-org-vars.yaml \
  --output acme-ai-policy.md
```

### Interactive Mode

Prompts for each variable value with examples from the template frontmatter:

```bash
./generator.sh --template <template.md> --interactive --output <output.md>
```

**Example:**

```bash
./generator.sh \
  --template ../../templates/ai-risk-assessment-framework.md \
  --interactive \
  --output acme-risk-framework.md
```

### Keep Frontmatter

By default, YAML frontmatter is stripped from the output. To keep it:

```bash
./generator.sh \
  --template ../../templates/ai-acceptable-use-policy.md \
  --vars my-vars.yaml \
  --output my-policy.md \
  --keep-frontmatter
```

## Variables File Format

Create a YAML file with key-value pairs matching the `{{VARIABLE}}` names in your template:

```yaml
# my-org-vars.yaml
ORGANIZATION_NAME: "Acme Corporation"
EFFECTIVE_DATE: "2026-03-01"
CLASSIFICATION: "Internal Use Only"
POLICY_OWNER: "Chief Information Security Officer"
APPROVER: "Board of Directors"
INDUSTRY: "Financial Services"
RISK_APPETITE: "Conservative - low tolerance for AI-related risks"
REVIEW_PERIOD: "Annual (or more frequently if regulatory changes occur)"
AI_GOVERNANCE_COMMITTEE: "AI Ethics and Governance Committee"
CONTACT_EMAIL: "ai-governance@acme.com"

# ... additional variables as needed
```

**Variable Naming Convention:**
- Use UPPERCASE_WITH_UNDERSCORES
- Must match exactly the `{{VARIABLE}}` names in the template
- Values can contain spaces, punctuation, and line breaks

## Interactive Mode

When run with `--interactive`, the script:

1. Extracts all `{{VARIABLE}}` placeholders from the template
2. Reads variable metadata from the template's YAML frontmatter
3. Prompts for each variable with:
   - Variable name
   - Description (from frontmatter)
   - Required/optional status
   - Example value (used as default if you press Enter)

**Example interaction:**

```
Variable: ORGANIZATION_NAME
  Description: Legal name of your organization
  Required: YES
  Value [Acme Corporation]:

Variable: EFFECTIVE_DATE
  Description: Date when policy becomes effective
  Required: YES
  Value [2026-03-01]: 2026-04-01

Variable: CLASSIFICATION
  Description: Document classification level
  Value [Internal Use Only]:
```

## How It Works

1. **Variable Extraction**: Script scans the template for all `{{VARIABLE}}` patterns
2. **Metadata Loading**: Reads variable descriptions and examples from template frontmatter
3. **Value Substitution**: Replaces each `{{VARIABLE}}` with the provided value
4. **Frontmatter Removal**: Strips the YAML frontmatter section (unless `--keep-frontmatter`)
5. **Validation**: Checks for any unreplaced variables and warns user

## Examples

### Example 1: Generate AI Acceptable Use Policy

```bash
# Create variables file
cat > acme-vars.yaml <<EOF
ORGANIZATION_NAME: "Acme Corporation"
EFFECTIVE_DATE: "2026-03-01"
CLASSIFICATION: "Internal Use Only"
POLICY_OWNER: "Chief Information Security Officer"
APPROVER: "CEO and Board of Directors"
EOF

# Generate policy
./generator.sh \
  --template ../../templates/ai-acceptable-use-policy.md \
  --vars acme-vars.yaml \
  --output acme-ai-policy.md

# Output: acme-ai-policy.md with all variables replaced
```

### Example 2: Interactive Generation

```bash
# Run in interactive mode - prompts for each variable
./generator.sh \
  --template ../../templates/model-development-lifecycle.md \
  --interactive \
  --output acme-ml-lifecycle.md
```

### Example 3: Generate Multiple Policies

```bash
# Use the same variables file for multiple templates
for template in ../../templates/*.md; do
  template_name=$(basename "$template" .md)
  ./generator.sh \
    --template "$template" \
    --vars acme-vars.yaml \
    --output "acme-${template_name}.md"
done
```

## Troubleshooting

### Error: "yq (mikefarah version) is not installed"

**Problem:** yq is not in your PATH or wrong version installed.

**Solution:**
```bash
# Check if yq is installed
which yq

# Check version (should show mikefarah version)
yq --version

# If wrong version or not installed, install mikefarah version
brew install yq  # macOS
```

### Warning: "The following variables were not replaced"

**Problem:** Variables in the template don't have corresponding values in your YAML file.

**Solution:**
- Review the list of unreplaced variables
- Add missing variables to your YAML file, or
- Accept that some variables will remain as `{{VARIABLE}}` for manual editing

### Error: "Required variable cannot be empty"

**Problem:** In interactive mode, you pressed Enter without providing a value for a required variable.

**Solution:** Provide a value for all required variables (marked with "Required: YES").

### Output Markdown is Malformed

**Problem:** Variable replacement corrupted Markdown formatting.

**Solution:**
- Ensure variable values don't contain unescaped Markdown characters
- Use quotes in YAML for values with special characters:
  ```yaml
  DESCRIPTION: "This is a [test] with (parentheses)"
  ```

## Tips

- **Start with interactive mode** to see all variables and their descriptions
- **Save your variables file** for future updates to the policy
- **Review the output** - automated generation doesn't replace human review
- **Keep backups** - use version control (git) for generated policies
- **Test first** - try generating with test values before using production data

## Integration with Templates

All templates in `../../templates/` are designed for use with this generator:

- `ai-acceptable-use-policy.md` - ~12 variables
- `ai-risk-assessment-framework.md` - ~15 variables
- `model-development-lifecycle.md` - ~14 variables

Each template's frontmatter includes:
```yaml
variables:
  - name: "VARIABLE_NAME"
    description: "What this variable represents"
    required: true/false
    example: "Example value"
```

## Security Considerations

- **Never commit variables files with sensitive data** - Add `*-vars.yaml` to `.gitignore`
- **Review generated output** before distributing - automated replacement doesn't validate content
- **Use appropriate classification** - generated policies may contain sensitive information
- **Sanitize examples** - don't use real credentials or PII in example values

## Contributing

Found a bug or have a suggestion? Open an issue or submit a pull request.

## License

CC0-1.0 (Public Domain)
