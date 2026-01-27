# GRC Automation Scripts

Automation tools for compliance workflows, evidence collection, and configuration auditing. Each script is designed to be run standalone with minimal dependencies.

## Purpose

These scripts help automate common GRC tasks that are time-consuming when done manually:
- Collecting compliance evidence from cloud environments (AWS)
- Auditing development platform configurations (GitHub) against security standards
- Generating customized policy documents from templates

All scripts are designed with security in mind, using read-only access where possible and requiring explicit credentials rather than embedded secrets.

## Available Scripts

| Script | Purpose | Language | Prerequisites |
|--------|---------|----------|---------------|
| [aws-evidence-collector](./aws-evidence-collector/) | Collect SOC 2 evidence from AWS | Python 3.11+ | boto3, AWS credentials |
| [github-soc2-checker](./github-soc2-checker/) | Audit GitHub settings for SOC 2 | Bash 5.x | gh CLI, jq |
| [template-generator](./template-generator/) | Generate policies from templates | Bash 5.x | yq |

## Getting Started

### AWS Evidence Collector

Collects compliance evidence from AWS services for SOC 2 audit preparation. Evidence includes IAM users/MFA status, encryption configurations, CloudTrail logging, and CloudWatch monitoring.

```bash
cd aws-evidence-collector

# Install dependencies
pip install -r requirements.txt

# Collect evidence (using AWS profile)
python collector.py --profile prod --output ./evidence --format json

# Collect evidence (using default credentials)
python collector.py --region us-east-1 --output ./evidence --format csv
```

**SOC 2 Controls Covered:** CC6.1 (Access Controls), CC6.2 (User Authorization), CC6.3 (Access Removal), CC6.7 (Encryption), CC7.2 (Monitoring), CC7.3 (Logging)

See [aws-evidence-collector/README.md](./aws-evidence-collector/README.md) for detailed usage.

### GitHub SOC 2 Checker

Audits GitHub organization and repository security configurations against SOC 2 requirements. Checks include MFA enforcement, branch protection, secret scanning, Dependabot, and audit logging.

```bash
cd github-soc2-checker

# Check entire organization
./checker.sh --org acme-corp

# Check specific repository
./checker.sh --org acme-corp --repo api-service

# Generate markdown report
./checker.sh --org acme-corp --format markdown > report.md
```

**SOC 2 Controls Covered:** CC6.1 (Access Controls), CC6.6 (Secrets Management), CC7.2 (Monitoring), CC8.1 (Change Management), CC3.2 (Risk Assessment)

See [github-soc2-checker/README.md](./github-soc2-checker/README.md) for detailed usage.

### Template Generator

Generates customized policy documents from templates by replacing `{{VARIABLE}}` placeholders with organization-specific values. Supports both YAML files and interactive mode.

```bash
cd template-generator

# Generate using variables file
./generator.sh \
  --template ../../templates/ai-acceptable-use-policy.md \
  --vars my-org-vars.yaml \
  --output my-policy.md

# Interactive mode (prompts for each variable)
./generator.sh \
  --template ../../templates/ai-risk-assessment-framework.md \
  --interactive \
  --output my-framework.md
```

**Templates Available:**
- AI Acceptable Use Policy
- AI Risk Assessment Framework
- Model Development Lifecycle Standard

See [template-generator/README.md](./template-generator/README.md) for detailed usage.

## Common Prerequisites

### Python Dependencies

Used by: aws-evidence-collector

```bash
# Python 3.11+ required
python --version

# Install pip packages
pip install boto3>=1.35.0
```

### Shell Tools

Used by: github-soc2-checker, template-generator

```bash
# Bash 5.x (pre-installed on macOS 10.15+)
bash --version

# jq - JSON processor (for GitHub checker)
brew install jq  # macOS
apt-get install jq  # Linux

# yq - YAML processor (for template generator)
brew install yq  # macOS (mikefarah version)
```

### Cloud CLI Tools

```bash
# AWS CLI (optional - boto3 can use credentials file)
brew install awscli
aws configure

# GitHub CLI (required for github-soc2-checker)
brew install gh
gh auth login
```

## Security Considerations

### Credentials Management

- **AWS Evidence Collector**: Uses boto3 Session with AWS profile or IAM role. Never hardcode credentials.
- **GitHub Checker**: Uses `gh` CLI authentication. Requires admin/owner access for org-level checks.
- **Template Generator**: No credentials required (operates on local files only).

### Least Privilege Access

Each script is designed to request only the minimum permissions needed:

- **AWS**: IAM policy template provided in `aws-evidence-collector/iam-policy.json` with read-only actions
- **GitHub**: Requires `read:org`, `repo`, `admin:org` scopes for configuration auditing (no write access needed)

### Data Sensitivity

- **Evidence files contain sensitive information** - Store securely and limit access
- **Never commit credentials** - Add AWS credentials and GitHub tokens to `.gitignore`
- **Review before sharing** - Evidence may contain account IDs, usernames, and configuration details

### Script Safety

All scripts follow defensive programming practices:
- `set -euo pipefail` in Bash scripts (fail fast on errors)
- Input validation and error handling
- No destructive operations (read-only by design)
- Clear error messages with remediation guidance

## Output Formats

### AWS Evidence Collector

- **JSON**: Complete nested structure, machine-readable, suitable for automated processing
- **CSV**: Flattened structure, suitable for spreadsheet analysis and auditor review

Both formats include:
- ISO 8601 timestamps
- SOC 2 control mappings (e.g., "CC6.1")
- Evidence metadata (collection time, account, region)

### GitHub SOC 2 Checker

- **Text**: Colored terminal output with PASS/FAIL/WARN status
- **JSON**: Machine-readable results for CI/CD integration
- **Markdown**: Formatted report for documentation

### Template Generator

- **Markdown**: Policy documents with variables replaced
- Optional: Keep or strip YAML frontmatter
- Warnings for unreplaced variables

## CI/CD Integration

### GitHub Actions Example

```yaml
# .github/workflows/compliance-check.yml
name: SOC 2 Compliance Check

on:
  schedule:
    - cron: '0 0 * * 1'  # Weekly on Monday
  workflow_dispatch:

jobs:
  github-audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run GitHub SOC 2 Checker
        run: |
          cd scripts/github-soc2-checker
          ./checker.sh --org ${{ github.repository_owner }} --format json > results.json
      - name: Upload results
        uses: actions/upload-artifact@v4
        with:
          name: compliance-results
          path: scripts/github-soc2-checker/results.json
```

### AWS Evidence Collection (Scheduled)

```bash
#!/bin/bash
# Run weekly via cron: 0 2 * * 1 /path/to/collect-evidence.sh

cd /opt/compliance/scripts/aws-evidence-collector

# Collect evidence
python collector.py \
  --profile prod \
  --output /opt/compliance/evidence/aws \
  --format both

# Archive previous evidence
tar -czf "evidence-$(date +%Y-%m-%d).tar.gz" /opt/compliance/evidence/aws/*.json

echo "Evidence collection complete: $(date)"
```

## Troubleshooting

### AWS Evidence Collector

**Error: "Unable to locate credentials"**
- Solution: Configure AWS credentials via `aws configure` or use `--profile` flag

**Error: "Access Denied" for specific AWS API calls**
- Solution: Review IAM policy in `aws-evidence-collector/iam-policy.json` and attach to IAM role/user

### GitHub SOC 2 Checker

**Error: "gh: command not found"**
- Solution: Install GitHub CLI: `brew install gh` (macOS) or see [cli.github.com](https://cli.github.com)

**Error: "HTTP 404" on organization checks**
- Solution: Ensure you have org owner/admin access. Run `gh auth status` to verify.

### Template Generator

**Error: "yq is not installed"**
- Solution: Install mikefarah yq: `brew install yq` (macOS) or download binary from [GitHub](https://github.com/mikefarah/yq)

**Warning: "Variables were not replaced"**
- Solution: Add missing variables to YAML file or accept manual editing

## Use Cases

### Audit Preparation

1. Collect AWS evidence weekly during audit period
2. Run GitHub configuration checks before auditor arrival
3. Generate updated policies from templates for auditor review

### Continuous Compliance Monitoring

1. Schedule GitHub checks in CI/CD to detect configuration drift
2. Alert on policy violations (MFA disabled, branch protection removed)
3. Track compliance posture over time

### Policy Management

1. Maintain policy templates in git with version control
2. Generate organization-specific policies with variables
3. Update all policies by modifying templates and re-generating

## Contributing

Contributions welcome! See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

### Adding New Scripts

New scripts should:
- Follow existing patterns (Bash for simple tasks, Python for complex APIs)
- Include comprehensive README with usage examples
- Provide clear error messages and troubleshooting guidance
- Use defensive programming (`set -euo pipefail`, input validation)
- Map evidence/checks to specific compliance controls (SOC 2, ISO 27001, etc.)

## License

CC0-1.0 (Public Domain) - To the extent possible under law, the authors have waived all copyright and related rights to this work.
