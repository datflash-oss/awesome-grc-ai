#!/usr/bin/env python3
"""
AWS SOC 2 Evidence Collector
Collects compliance evidence from AWS for SOC 2 audit preparation.

Usage:
    python collector.py --profile <aws-profile> --output <output-dir> --format <json|csv|both>
"""

import boto3
import json
import csv
import argparse
import os
from datetime import datetime
from typing import Dict, List, Any


class AWSEvidenceCollector:
    """Collects SOC 2 compliance evidence from AWS services."""

    def __init__(self, profile: str = None, region: str = None):
        """
        Initialize AWS session with optional profile and region.

        Args:
            profile: AWS profile name from ~/.aws/credentials
            region: AWS region (defaults to us-east-1)
        """
        session_args = {}
        if profile:
            session_args['profile_name'] = profile
        if region:
            session_args['region_name'] = region
        else:
            session_args['region_name'] = 'us-east-1'

        try:
            self.session = boto3.Session(**session_args)
            self.region = self.session.region_name
            # Get account ID
            sts = self.session.client('sts')
            self.account_id = sts.get_caller_identity()['Account']
        except Exception as e:
            raise RuntimeError(f"Failed to initialize AWS session: {e}")

        self.timestamp = datetime.utcnow().isoformat() + 'Z'

    def collect_iam_evidence(self) -> Dict[str, Any]:
        """
        Collect IAM user access evidence for CC6.1, CC6.2, CC6.3 (Access Controls).

        Returns:
            dict: Evidence structure with users, MFA status, access keys, groups, policies
        """
        print("Collecting IAM evidence...")
        iam = self.session.client('iam')
        evidence = {
            'collection_timestamp': self.timestamp,
            'account_id': self.account_id,
            'control_mapping': ['CC6.1', 'CC6.2', 'CC6.3'],
            'evidence_type': 'IAM User Access Report',
            'description': 'Logical and physical access controls, user registration/authorization, access removal',
            'users': []
        }

        try:
            # Use paginator for large user lists
            paginator = iam.get_paginator('list_users')

            for page in paginator.paginate():
                for user in page['Users']:
                    user_name = user['UserName']

                    try:
                        # Get MFA devices
                        mfa_devices = iam.list_mfa_devices(UserName=user_name)['MFADevices']

                        # Get access keys
                        access_keys = iam.list_access_keys(UserName=user_name)['AccessKeyMetadata']

                        # Get groups
                        groups = iam.list_groups_for_user(UserName=user_name)['Groups']

                        # Get attached policies
                        attached_policies = iam.list_attached_user_policies(
                            UserName=user_name
                        )['AttachedPolicies']

                        # Get inline policies
                        inline_policies = iam.list_user_policies(
                            UserName=user_name
                        )['PolicyNames']

                        # Get password last used (if console access)
                        password_last_used = user.get('PasswordLastUsed')

                        user_data = {
                            'username': user_name,
                            'user_id': user['UserId'],
                            'arn': user['Arn'],
                            'created_date': user['CreateDate'].isoformat(),
                            'password_last_used': password_last_used.isoformat() if password_last_used else None,
                            'mfa_enabled': len(mfa_devices) > 0,
                            'mfa_devices': [
                                {
                                    'serial': d['SerialNumber'],
                                    'type': 'virtual' if 'mfa/virtual' in d['SerialNumber'] else 'hardware'
                                }
                                for d in mfa_devices
                            ],
                            'access_keys': [
                                {
                                    'key_id': k['AccessKeyId'],
                                    'status': k['Status'],
                                    'created': k['CreateDate'].isoformat()
                                }
                                for k in access_keys
                            ],
                            'groups': [g['GroupName'] for g in groups],
                            'attached_policies': [p['PolicyName'] for p in attached_policies],
                            'inline_policies': inline_policies,
                        }

                        evidence['users'].append(user_data)

                    except Exception as e:
                        print(f"  Warning: Could not collect full data for user {user_name}: {e}")
                        continue

            # Add summary statistics
            evidence['summary'] = {
                'total_users': len(evidence['users']),
                'users_with_mfa': sum(1 for u in evidence['users'] if u['mfa_enabled']),
                'users_without_mfa': sum(1 for u in evidence['users'] if not u['mfa_enabled']),
                'users_with_console_access': sum(1 for u in evidence['users'] if u['password_last_used']),
                'users_with_access_keys': sum(1 for u in evidence['users'] if u['access_keys']),
            }

            print(f"  Collected evidence for {evidence['summary']['total_users']} IAM users")

        except Exception as e:
            raise RuntimeError(f"Failed to collect IAM evidence: {e}")

        return evidence

    def collect_encryption_evidence(self) -> Dict[str, Any]:
        """
        Collect encryption status for CC6.7 (Encryption).

        Returns:
            dict: Evidence structure with S3, RDS, EBS encryption status
        """
        print("Collecting encryption evidence...")
        evidence = {
            'collection_timestamp': self.timestamp,
            'account_id': self.account_id,
            'region': self.region,
            'control_mapping': ['CC6.7'],
            'evidence_type': 'Encryption at Rest Report',
            'description': 'Data protection at rest through encryption',
            's3_buckets': [],
            'rds_instances': [],
            'ebs_volumes': []
        }

        # S3 bucket encryption
        try:
            s3 = self.session.client('s3')
            buckets = s3.list_buckets()['Buckets']

            for bucket in buckets:
                bucket_name = bucket['Name']
                try:
                    encryption = s3.get_bucket_encryption(Bucket=bucket_name)
                    encrypted = True
                    encryption_type = encryption['ServerSideEncryptionConfiguration']['Rules'][0]['ApplyServerSideEncryptionByDefault']['SSEAlgorithm']
                except s3.exceptions.ServerSideEncryptionConfigurationNotFoundError:
                    encrypted = False
                    encryption_type = None
                except Exception:
                    encrypted = None
                    encryption_type = 'unknown'

                evidence['s3_buckets'].append({
                    'bucket_name': bucket_name,
                    'created': bucket['CreationDate'].isoformat(),
                    'encrypted': encrypted,
                    'encryption_type': encryption_type
                })

            print(f"  Collected encryption status for {len(evidence['s3_buckets'])} S3 buckets")

        except Exception as e:
            print(f"  Warning: Could not collect S3 encryption evidence: {e}")

        # RDS instance encryption
        try:
            rds = self.session.client('rds')
            paginator = rds.get_paginator('describe_db_instances')

            for page in paginator.paginate():
                for instance in page['DBInstances']:
                    evidence['rds_instances'].append({
                        'db_instance_identifier': instance['DBInstanceIdentifier'],
                        'engine': instance['Engine'],
                        'encrypted': instance.get('StorageEncrypted', False),
                        'kms_key_id': instance.get('KmsKeyId'),
                        'created': instance['InstanceCreateTime'].isoformat()
                    })

            print(f"  Collected encryption status for {len(evidence['rds_instances'])} RDS instances")

        except Exception as e:
            print(f"  Warning: Could not collect RDS encryption evidence: {e}")

        # EBS volume encryption
        try:
            ec2 = self.session.client('ec2')
            paginator = ec2.get_paginator('describe_volumes')

            for page in paginator.paginate():
                for volume in page['Volumes']:
                    evidence['ebs_volumes'].append({
                        'volume_id': volume['VolumeId'],
                        'size_gb': volume['Size'],
                        'encrypted': volume['Encrypted'],
                        'kms_key_id': volume.get('KmsKeyId'),
                        'created': volume['CreateTime'].isoformat(),
                        'state': volume['State']
                    })

            print(f"  Collected encryption status for {len(evidence['ebs_volumes'])} EBS volumes")

        except Exception as e:
            print(f"  Warning: Could not collect EBS encryption evidence: {e}")

        # Add summary statistics
        evidence['summary'] = {
            's3_encrypted': sum(1 for b in evidence['s3_buckets'] if b['encrypted'] is True),
            's3_unencrypted': sum(1 for b in evidence['s3_buckets'] if b['encrypted'] is False),
            's3_total': len(evidence['s3_buckets']),
            'rds_encrypted': sum(1 for r in evidence['rds_instances'] if r['encrypted']),
            'rds_unencrypted': sum(1 for r in evidence['rds_instances'] if not r['encrypted']),
            'rds_total': len(evidence['rds_instances']),
            'ebs_encrypted': sum(1 for v in evidence['ebs_volumes'] if v['encrypted']),
            'ebs_unencrypted': sum(1 for v in evidence['ebs_volumes'] if not v['encrypted']),
            'ebs_total': len(evidence['ebs_volumes'])
        }

        return evidence

    def collect_cloudtrail_evidence(self) -> Dict[str, Any]:
        """
        Collect CloudTrail logging evidence for CC7.2 (Logging).

        Returns:
            dict: Evidence structure with CloudTrail trail status and configuration
        """
        print("Collecting CloudTrail evidence...")
        cloudtrail = self.session.client('cloudtrail')
        evidence = {
            'collection_timestamp': self.timestamp,
            'account_id': self.account_id,
            'region': self.region,
            'control_mapping': ['CC7.2'],
            'evidence_type': 'System Activity Logging Report',
            'description': 'System activity monitoring and logging',
            'trails': []
        }

        try:
            trails = cloudtrail.describe_trails()['trailList']

            for trail in trails:
                trail_name = trail['Name']

                try:
                    # Get trail status
                    status = cloudtrail.get_trail_status(Name=trail_name)

                    # Get event selectors
                    event_selectors = cloudtrail.get_event_selectors(TrailName=trail_name)

                    trail_data = {
                        'name': trail_name,
                        'arn': trail.get('TrailARN'),
                        's3_bucket': trail.get('S3BucketName'),
                        'is_multi_region': trail.get('IsMultiRegionTrail', False),
                        'is_organization_trail': trail.get('IsOrganizationTrail', False),
                        'log_file_validation_enabled': trail.get('LogFileValidationEnabled', False),
                        'is_logging': status.get('IsLogging', False),
                        'latest_delivery_time': status.get('LatestDeliveryTime').isoformat() if status.get('LatestDeliveryTime') else None,
                        'event_selectors': event_selectors.get('EventSelectors', [])
                    }

                    evidence['trails'].append(trail_data)

                except Exception as e:
                    print(f"  Warning: Could not collect full data for trail {trail_name}: {e}")
                    continue

            print(f"  Collected evidence for {len(evidence['trails'])} CloudTrail trails")

            # Add summary statistics
            evidence['summary'] = {
                'total_trails': len(evidence['trails']),
                'multi_region_trails': sum(1 for t in evidence['trails'] if t['is_multi_region']),
                'logging_enabled': sum(1 for t in evidence['trails'] if t['is_logging']),
                'log_validation_enabled': sum(1 for t in evidence['trails'] if t['log_file_validation_enabled'])
            }

        except Exception as e:
            raise RuntimeError(f"Failed to collect CloudTrail evidence: {e}")

        return evidence

    def collect_cloudwatch_evidence(self) -> Dict[str, Any]:
        """
        Collect CloudWatch monitoring evidence for CC7.3 (Monitoring).

        Returns:
            dict: Evidence structure with CloudWatch alarms and log groups
        """
        print("Collecting CloudWatch evidence...")
        cloudwatch = self.session.client('cloudwatch')
        logs = self.session.client('logs')
        evidence = {
            'collection_timestamp': self.timestamp,
            'account_id': self.account_id,
            'region': self.region,
            'control_mapping': ['CC7.3'],
            'evidence_type': 'Monitoring and Alerting Report',
            'description': 'System monitoring and alerting configuration',
            'alarms': [],
            'log_groups': []
        }

        # CloudWatch alarms
        try:
            paginator = cloudwatch.get_paginator('describe_alarms')

            for page in paginator.paginate():
                for alarm in page['MetricAlarms']:
                    evidence['alarms'].append({
                        'alarm_name': alarm['AlarmName'],
                        'alarm_description': alarm.get('AlarmDescription'),
                        'state': alarm['StateValue'],
                        'metric_name': alarm.get('MetricName'),
                        'namespace': alarm.get('Namespace'),
                        'actions_enabled': alarm.get('ActionsEnabled', False),
                        'alarm_actions': alarm.get('AlarmActions', []),
                        'created': alarm.get('AlarmConfigurationUpdatedTimestamp').isoformat() if alarm.get('AlarmConfigurationUpdatedTimestamp') else None
                    })

            print(f"  Collected {len(evidence['alarms'])} CloudWatch alarms")

        except Exception as e:
            print(f"  Warning: Could not collect CloudWatch alarms: {e}")

        # CloudWatch log groups
        try:
            paginator = logs.get_paginator('describe_log_groups')

            for page in paginator.paginate():
                for log_group in page['logGroups']:
                    evidence['log_groups'].append({
                        'log_group_name': log_group['logGroupName'],
                        'creation_time': datetime.fromtimestamp(log_group['creationTime'] / 1000).isoformat() + 'Z',
                        'retention_days': log_group.get('retentionInDays'),
                        'stored_bytes': log_group.get('storedBytes', 0)
                    })

            print(f"  Collected {len(evidence['log_groups'])} CloudWatch log groups")

        except Exception as e:
            print(f"  Warning: Could not collect CloudWatch log groups: {e}")

        # Add summary statistics
        evidence['summary'] = {
            'total_alarms': len(evidence['alarms']),
            'alarms_in_ok_state': sum(1 for a in evidence['alarms'] if a['state'] == 'OK'),
            'alarms_in_alarm_state': sum(1 for a in evidence['alarms'] if a['state'] == 'ALARM'),
            'alarms_with_actions': sum(1 for a in evidence['alarms'] if a['actions_enabled']),
            'total_log_groups': len(evidence['log_groups']),
            'log_groups_with_retention': sum(1 for lg in evidence['log_groups'] if lg['retention_days'])
        }

        return evidence

    def export_json(self, evidence: Dict, output_dir: str):
        """
        Export evidence to JSON file.

        Args:
            evidence: Complete evidence dictionary
            output_dir: Output directory path
        """
        os.makedirs(output_dir, exist_ok=True)
        timestamp_safe = self.timestamp.replace(':', '-').replace('.', '-')
        filepath = os.path.join(output_dir, f'aws_evidence_{timestamp_safe}.json')

        with open(filepath, 'w') as f:
            json.dump(evidence, f, indent=2, default=str)

        print(f"\nJSON evidence exported to: {filepath}")
        return filepath

    def export_csv(self, evidence: Dict, output_dir: str):
        """
        Export evidence to CSV files (one per evidence type).

        Args:
            evidence: Complete evidence dictionary
            output_dir: Output directory path
        """
        os.makedirs(output_dir, exist_ok=True)
        timestamp_safe = self.timestamp.replace(':', '-').replace('.', '-')
        csv_files = []

        # IAM users CSV
        if 'iam' in evidence and evidence['iam'].get('users'):
            filepath = os.path.join(output_dir, f'aws_iam_users_{timestamp_safe}.csv')
            with open(filepath, 'w', newline='') as f:
                fieldnames = ['username', 'user_id', 'created_date', 'mfa_enabled', 'password_last_used',
                              'access_key_count', 'groups', 'attached_policies']
                writer = csv.DictWriter(f, fieldnames=fieldnames)
                writer.writeheader()

                for user in evidence['iam']['users']:
                    writer.writerow({
                        'username': user['username'],
                        'user_id': user['user_id'],
                        'created_date': user['created_date'],
                        'mfa_enabled': user['mfa_enabled'],
                        'password_last_used': user['password_last_used'] or 'Never',
                        'access_key_count': len(user['access_keys']),
                        'groups': ', '.join(user['groups']),
                        'attached_policies': ', '.join(user['attached_policies'])
                    })

            csv_files.append(filepath)
            print(f"CSV evidence exported to: {filepath}")

        # S3 encryption CSV
        if 'encryption' in evidence and evidence['encryption'].get('s3_buckets'):
            filepath = os.path.join(output_dir, f'aws_s3_encryption_{timestamp_safe}.csv')
            with open(filepath, 'w', newline='') as f:
                fieldnames = ['bucket_name', 'created', 'encrypted', 'encryption_type']
                writer = csv.DictWriter(f, fieldnames=fieldnames)
                writer.writeheader()

                for bucket in evidence['encryption']['s3_buckets']:
                    writer.writerow(bucket)

            csv_files.append(filepath)
            print(f"CSV evidence exported to: {filepath}")

        # CloudTrail CSV
        if 'logging' in evidence and evidence['logging'].get('trails'):
            filepath = os.path.join(output_dir, f'aws_cloudtrail_{timestamp_safe}.csv')
            with open(filepath, 'w', newline='') as f:
                fieldnames = ['name', 's3_bucket', 'is_multi_region', 'is_logging', 'log_file_validation_enabled']
                writer = csv.DictWriter(f, fieldnames=fieldnames)
                writer.writeheader()

                for trail in evidence['logging']['trails']:
                    writer.writerow({
                        'name': trail['name'],
                        's3_bucket': trail['s3_bucket'],
                        'is_multi_region': trail['is_multi_region'],
                        'is_logging': trail['is_logging'],
                        'log_file_validation_enabled': trail['log_file_validation_enabled']
                    })

            csv_files.append(filepath)
            print(f"CSV evidence exported to: {filepath}")

        return csv_files


def main():
    parser = argparse.ArgumentParser(
        description='AWS SOC 2 Evidence Collector - Collects compliance evidence from AWS services',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Collect evidence using default AWS profile
  python collector.py

  # Collect evidence using specific profile
  python collector.py --profile production

  # Collect evidence for specific region
  python collector.py --profile production --region us-west-2

  # Export both JSON and CSV formats
  python collector.py --format both --output ./audit-2026

SOC 2 Control Mapping:
  CC6.1, CC6.2, CC6.3 - IAM Access Controls
  CC6.7 - Encryption at Rest
  CC7.2 - System Activity Logging
  CC7.3 - Monitoring and Alerting
        """
    )
    parser.add_argument('--profile', help='AWS profile name from ~/.aws/credentials')
    parser.add_argument('--region', default='us-east-1', help='AWS region (default: us-east-1)')
    parser.add_argument('--output', default='./evidence', help='Output directory (default: ./evidence)')
    parser.add_argument('--format', choices=['json', 'csv', 'both'], default='json',
                        help='Output format: json, csv, or both (default: json)')
    args = parser.parse_args()

    print("=" * 60)
    print("AWS SOC 2 Evidence Collector")
    print("=" * 60)
    print(f"Profile: {args.profile or 'default'}")
    print(f"Region: {args.region}")
    print(f"Output: {args.output}")
    print(f"Format: {args.format}")
    print("=" * 60)
    print()

    try:
        collector = AWSEvidenceCollector(profile=args.profile, region=args.region)
        print(f"Authenticated as Account ID: {collector.account_id}")
        print()

        # Collect all evidence
        evidence = {
            'metadata': {
                'collection_timestamp': collector.timestamp,
                'account_id': collector.account_id,
                'region': collector.region,
                'collector_version': '1.0'
            },
            'iam': collector.collect_iam_evidence(),
            'encryption': collector.collect_encryption_evidence(),
            'logging': collector.collect_cloudtrail_evidence(),
            'monitoring': collector.collect_cloudwatch_evidence(),
        }

        print()
        print("=" * 60)
        print("Evidence Collection Complete")
        print("=" * 60)
        print()

        # Export results
        if args.format in ['json', 'both']:
            collector.export_json(evidence, args.output)

        if args.format in ['csv', 'both']:
            collector.export_csv(evidence, args.output)

        print()
        print("Evidence collection completed successfully!")
        print(f"Review evidence files in: {args.output}")

    except RuntimeError as e:
        print(f"\nError: {e}")
        return 1
    except Exception as e:
        print(f"\nUnexpected error: {e}")
        return 1

    return 0


if __name__ == '__main__':
    exit(main())
