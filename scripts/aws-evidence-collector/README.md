# AWS SOC 2 Evidence Collector

Automated Python script for collecting SOC 2 compliance evidence from AWS services. Generates audit-ready JSON and CSV reports with evidence mapped to SOC 2 Trust Service Criteria.

## Purpose

This script automates the collection of compliance evidence from AWS for SOC 2 audit preparation. It gathers evidence across IAM access controls, encryption at rest, logging, and monitoring, providing auditors with timestamped, structured evidence aligned to specific SOC 2 controls.

**Use this script when:**
- Preparing for an initial SOC 2 audit
- Conducting quarterly evidence collection for ongoing SOC 2 compliance
- Performing gap analysis against SOC 2 requirements
- Responding to auditor evidence requests

**Do NOT use this script for:**
- Continuous compliance monitoring (use AWS Audit Manager or AWS Config instead)
- Real-time security alerting (use AWS Security Hub)
- Comprehensive security assessment (this covers SOC 2 controls only)

## SOC 2 Control Mapping

The script collects evidence for the following SOC 2 Trust Service Criteria:

| Evidence Type | SOC 2 Control | Description | Audit Purpose |
|---------------|---------------|-------------|---------------|
| IAM Users | CC6.1 | Logical and physical access controls | Verify user access is properly controlled |
| IAM Users | CC6.2 | Registration and authorization of new users | Confirm user provisioning process |
| IAM Users | CC6.3 | Removal of user access | Demonstrate access removal for terminated users |
| MFA Status | CC6.1 | Multi-factor authentication | Prove MFA enforcement for privileged access |
| Access Keys | CC6.1, CC6.2 | Programmatic access controls | Identify long-lived credentials and rotation needs |
| S3 Encryption | CC6.7 | Data protection at rest | Verify sensitive data is encrypted |
| RDS Encryption | CC6.7 | Database encryption | Confirm database encryption status |
| EBS Encryption | CC6.7 | Volume encryption | Demonstrate storage encryption |
| CloudTrail | CC7.2 | System activity logging | Prove comprehensive audit logging |
| Log Validation | CC7.2 | Log integrity | Verify logs cannot be tampered with |
| CloudWatch Alarms | CC7.3 | Monitoring and alerting | Show proactive monitoring is in place |
| Log Groups | CC7.3 | Log retention | Demonstrate logs are retained per policy |

## Prerequisites

- **Python:** 3.11 or higher
- **AWS CLI:** Configured with at least one named profile or default credentials
- **IAM Permissions:** Read-only access to IAM, S3, RDS, EC2, CloudTrail, CloudWatch (see [IAM Permissions](#iam-permissions))
- **Network Access:** Script must be able to reach AWS API endpoints

## Installation

1. Clone the repository or download the script:
   ```bash
   cd scripts/aws-evidence-collector
   ```

2. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Verify AWS CLI is configured:
   ```bash
   aws sts get-caller-identity --profile your-profile-name
   ```

## Usage

### Basic Usage

Collect evidence using the default AWS profile:

```bash
python collector.py
```

### With Specific AWS Profile

Collect evidence using a named AWS profile:

```bash
python collector.py --profile production
```

### With Specific Region

Collect evidence for a specific AWS region:

```bash
python collector.py --profile production --region us-west-2
```

**Note:** IAM evidence is global, but encryption, CloudTrail, and CloudWatch evidence is region-specific. Run the script once per region if you have resources in multiple regions.

### Export Formats

Export both JSON and CSV formats:

```bash
python collector.py --profile production --format both
```

Export only CSV:

```bash
python collector.py --profile production --format csv
```

### Custom Output Directory

Specify a custom output directory:

```bash
python collector.py --profile production --output ./audit-2026-q1
```

### Complete Example

```bash
python collector.py \
  --profile production \
  --region us-east-1 \
  --output ./soc2-evidence-2026-01 \
  --format both
```

### Command-Line Options

| Option | Required | Default | Description |
|--------|----------|---------|-------------|
| `--profile` | No | `default` | AWS profile name from `~/.aws/credentials` |
| `--region` | No | `us-east-1` | AWS region to collect evidence from |
| `--output` | No | `./evidence` | Output directory for evidence files |
| `--format` | No | `json` | Output format: `json`, `csv`, or `both` |
| `--help` | No | - | Display help message with examples |

## IAM Permissions

### Minimum Required Permissions

The script requires read-only access to AWS services. Use the provided IAM policy template:

```bash
# Create IAM policy from template
aws iam create-policy \
  --policy-name SOC2EvidenceCollectorReadOnly \
  --policy-document file://iam-policy.json
```

### Creating an IAM User for Evidence Collection

1. Create a dedicated IAM user for evidence collection:
   ```bash
   aws iam create-user --user-name soc2-evidence-collector
   ```

2. Attach the read-only policy:
   ```bash
   aws iam attach-user-policy \
     --user-name soc2-evidence-collector \
     --policy-arn arn:aws:iam::ACCOUNT_ID:policy/SOC2EvidenceCollectorReadOnly
   ```

3. Create access keys:
   ```bash
   aws iam create-access-key --user-name soc2-evidence-collector
   ```

4. Configure AWS CLI profile:
   ```bash
   aws configure --profile soc2-evidence
   # Enter access key ID and secret access key when prompted
   ```

### Using IAM Roles (Recommended for EC2/Lambda)

If running the script from an EC2 instance or Lambda function, use an IAM role instead of access keys:

1. Create an IAM role with the provided policy
2. Attach the role to your EC2 instance or Lambda function
3. Run the script without specifying a profile (it will use the instance role automatically)

### What the Policy Does NOT Allow

The provided IAM policy is **read-only** and does NOT allow:
- Creating, modifying, or deleting any AWS resources
- Accessing S3 object data (only bucket configuration)
- Reading RDS data (only instance configuration)
- Modifying IAM users, groups, or policies
- Changing CloudTrail or CloudWatch configuration

## Output Format

### JSON Output

The script generates a single JSON file: `aws_evidence_YYYY-MM-DDTHH-MM-SSZ.json`

**Structure:**
```json
{
  "metadata": {
    "collection_timestamp": "2026-01-27T12:00:00Z",
    "account_id": "123456789012",
    "region": "us-east-1",
    "collector_version": "1.0"
  },
  "iam": {
    "collection_timestamp": "2026-01-27T12:00:00Z",
    "control_mapping": ["CC6.1", "CC6.2", "CC6.3"],
    "users": [
      {
        "username": "john.doe",
        "mfa_enabled": true,
        "access_keys": [...],
        "groups": [...],
        "attached_policies": [...]
      }
    ],
    "summary": {
      "total_users": 25,
      "users_with_mfa": 23,
      "users_without_mfa": 2
    }
  },
  "encryption": { ... },
  "logging": { ... },
  "monitoring": { ... }
}
```

### CSV Output

The script generates multiple CSV files (one per evidence type):

- `aws_iam_users_YYYY-MM-DDTHH-MM-SSZ.csv` - IAM user access controls
- `aws_s3_encryption_YYYY-MM-DDTHH-MM-SSZ.csv` - S3 bucket encryption status
- `aws_cloudtrail_YYYY-MM-DDTHH-MM-SSZ.csv` - CloudTrail configuration

CSV files are flattened for easy import into spreadsheets and audit management tools.

### Timestamps

All evidence includes:
- **Collection timestamp** in ISO 8601 format (UTC)
- **Resource creation dates** for audit trail
- **Last activity dates** where available (e.g., password last used)

Timestamps are critical for auditors to verify evidence is current and relevant to the audit period.

## Troubleshooting

### Error: "Failed to initialize AWS session"

**Cause:** AWS credentials not configured or profile not found.

**Solutions:**
- Verify AWS CLI is configured: `aws configure list --profile your-profile`
- Check that `~/.aws/credentials` contains the specified profile
- Try using the default profile: `python collector.py` (without `--profile`)

### Error: "An error occurred (AccessDenied) when calling X operation"

**Cause:** IAM user/role lacks required permissions.

**Solutions:**
- Verify the IAM policy is attached: `aws iam list-attached-user-policies --user-name your-user`
- Check the policy JSON matches `iam-policy.json`
- Ensure the policy allows the specific action listed in the error message
- Try running with `--region` matching your IAM user's region

### Warning: "Could not collect X evidence"

**Cause:** Service is not enabled, region has no resources, or partial permissions.

**Impact:** Script continues and collects other evidence types. The warning is informational.

**Solutions:**
- Check if the service is enabled in your account (e.g., RDS, CloudTrail)
- Verify the region has resources (e.g., `aws s3 ls` for S3 buckets)
- Review IAM permissions for the specific service

### Error: "No module named 'boto3'"

**Cause:** boto3 not installed.

**Solution:**
```bash
pip install -r requirements.txt
```

If using a virtual environment, activate it first:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### Performance: Script runs slowly on large accounts

**Cause:** Account has thousands of IAM users, S3 buckets, or EBS volumes.

**Expected behavior:** Script uses pagination to handle large result sets. Progress is printed to console.

**Tips:**
- Run during off-hours to avoid API rate limiting
- Consider collecting evidence per region rather than all regions at once
- For accounts with 10,000+ resources, expect 5-10 minute runtime

### Rate Limiting: "Rate exceeded" errors

**Cause:** Too many API calls in a short period.

**Solutions:**
- Wait a few minutes and retry
- Run the script less frequently (e.g., quarterly instead of weekly)
- Use AWS Audit Manager for continuous compliance monitoring instead

## Security Considerations

### Credential Handling

- **Never commit AWS credentials to version control**
- Use AWS profiles or IAM roles instead of hardcoded credentials
- Rotate access keys regularly (every 90 days minimum)
- Use separate credentials for evidence collection vs. production access

### Evidence Storage

- Evidence files contain sensitive configuration information (user names, resource IDs, ARNs)
- Store evidence files securely with encryption at rest
- Restrict access to evidence files to audit team only
- Delete evidence files after audit completion (or retain per records retention policy)

### Audit Trail

- The script itself is read-only and does not modify AWS resources
- All API calls are logged in CloudTrail for audit purposes
- Include the evidence collection timestamp in audit documentation

## Limitations

### What This Script Does NOT Collect

- **Application logs:** Use CloudWatch Logs API directly or download logs from S3
- **VPC Flow Logs:** Use AWS CLI to download VPC Flow Logs
- **AWS Config rules:** Use AWS Config API or AWS Audit Manager
- **Security Hub findings:** Use Security Hub API
- **GuardDuty findings:** Use GuardDuty API
- **IAM Access Analyzer findings:** Use Access Analyzer API

### Multi-Account Environments

This script collects evidence from a single AWS account. For multi-account environments:

- Run the script once per account with different profiles
- Use AWS Organizations and cross-account IAM roles for centralized collection
- Consider AWS Audit Manager for automated multi-account evidence collection

### When to Use AWS Audit Manager Instead

Use AWS Audit Manager (not this script) if you need:

- **Continuous compliance monitoring** across multiple accounts
- **Automated evidence collection** on a schedule
- **Built-in SOC 2 framework** with pre-configured controls
- **Integration with AWS Security Hub** for real-time findings
- **Auditor collaboration features** for evidence review

This script is best for:

- Ad-hoc evidence collection during audit prep
- Custom evidence requirements not covered by Audit Manager
- Organizations without AWS Audit Manager (requires AWS Enterprise Support or equivalent)
- Learning and understanding AWS SOC 2 evidence requirements

## Version History

**v1.0** (2026-01-27)
- Initial release
- IAM, S3, RDS, EBS, CloudTrail, CloudWatch evidence collection
- JSON and CSV export formats
- SOC 2 control mapping for CC6.1, CC6.2, CC6.3, CC6.7, CC7.2, CC7.3

## Support and Contributing

For issues, feature requests, or contributions, see the main repository README.

## License

See the repository LICENSE file for license information.
