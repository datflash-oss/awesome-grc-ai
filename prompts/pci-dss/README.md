# PCI DSS Prompts

Prompts for PCI DSS compliance preparation, gap analysis, and security assessments for organizations handling payment card data.

## About PCI DSS

PCI DSS (Payment Card Industry Data Security Standard) is a security standard for organizations that handle credit card information from major card brands (Visa, Mastercard, American Express, Discover, JCB). Compliance is mandatory for any organization that accepts, processes, stores, or transmits payment card data.

### The 12 Requirements

PCI DSS v4.0 (current version, effective March 31, 2024) organizes security controls into 12 requirements across 6 objectives:

**Build and Maintain a Secure Network and Systems**
1. Install and maintain network security controls
2. Apply secure configurations to all system components

**Protect Account Data**
3. Protect stored account data
4. Protect cardholder data with strong cryptography during transmission over open, public networks

**Maintain a Vulnerability Management Program**
5. Protect all systems and networks from malicious software
6. Develop and maintain secure systems and software

**Implement Strong Access Control Measures**
7. Restrict access to system components and cardholder data by business need to know
8. Identify users and authenticate access to system components
9. Restrict physical access to cardholder data

**Regularly Monitor and Test Networks**
10. Log and monitor all access to system components and cardholder data
11. Test security of systems and networks regularly

**Maintain an Information Security Policy**
12. Support information security with organizational policies and programs

### PCI DSS v4.0 Key Changes

Version 4.0 (released March 2022, mandatory March 2025) introduced:
- **Customized approach** option alongside defined approach for meeting requirements
- **Enhanced focus on continuous monitoring** vs. point-in-time compliance
- **Multi-factor authentication expansion** (now required for all access to cardholder data environment)
- **Phishing-resistant MFA** required by March 2027
- **Targeted risk analysis** required for specific requirements (1.2.3, 8.3.6, 8.3.9, etc.)

Organizations have until March 31, 2025 to comply with v4.0 mandatory requirements.

### Compliance Levels

PCI DSS compliance requirements vary by transaction volume:

| Level | Annual Visa Transactions | Validation Requirements |
|-------|-------------------------|-------------------------|
| **Level 1** | 6M+ (or suffered breach) | Annual on-site audit by QSA, quarterly network scans |
| **Level 2** | 1M - 6M | Annual Self-Assessment Questionnaire (SAQ), quarterly network scans |
| **Level 3** | 20K - 1M (e-commerce) | Annual SAQ, quarterly network scans |
| **Level 4** | <20K (e-commerce) or <1M (all channels) | Annual SAQ, quarterly network scans (at acquirer discretion) |

**QSA**: Qualified Security Assessor (third-party auditor)
**SAQ**: Self-Assessment Questionnaire (options: A, A-EP, B, B-IP, C, D-Merchant, D-Service Provider)

## Available Prompts

### 1. [PCI DSS Gap Analysis](./gap-analysis.md)
**Use case**: Identifying compliance gaps against PCI DSS v4.0 requirements
**Complexity**: Intermediate
**Time**: 15-20 minutes
**Output**: Structured gap analysis table with requirement mappings, current state, gaps, risk levels (Critical/High/Medium/Low), and remediation timelines

**When to use**: Initial compliance assessment, annual reviews, post-breach analysis, or when scoping new cardholder data environments.

### 2. PCI DSS Scoping Assessment *(Coming soon)*
**Use case**: Determining cardholder data environment (CDE) boundaries and in-scope systems
**Complexity**: Intermediate
**Time**: 15 minutes
**Output**: Network segmentation diagram recommendations and in-scope system inventory

### 3. PCI DSS SAQ Selector *(Coming soon)*
**Use case**: Determining which Self-Assessment Questionnaire (SAQ) applies to your environment
**Complexity**: Beginner
**Time**: 5 minutes
**Output**: SAQ recommendation with rationale and requirements overview

## How to Use These Prompts

1. **Determine your validation level**: Based on annual transaction volume (see Compliance Levels table above).

2. **Understand your environment**: Document:
   - How you accept payments (e-commerce, point-of-sale, phone, mail order)
   - Where cardholder data flows (payment gateway, processor, storage)
   - Network architecture (segmentation, public vs. internal systems)
   - Current security controls (firewalls, encryption, access controls, logging)

3. **Choose the right prompt**:
   - Starting PCI DSS? → Gap Analysis
   - Need to define scope? → Scoping Assessment
   - Choosing SAQ type? → SAQ Selector

4. **Gather required information** (see Variables section in each prompt).

5. **Copy and replace variables** in the prompt template.

6. **Paste into Claude** and wait 15-30 seconds.

7. **Validate with a QSA**: For Level 1 merchants, validation by a Qualified Security Assessor is mandatory. For other levels, consider QSA consultation to ensure accuracy.

## Prerequisites

Before using these prompts, ensure you have:

- **Cardholder data flow diagram**: Document how payment data enters, moves through, and exits your environment
- **Network architecture documentation**: Diagram showing system components, network segments, and trust boundaries
- **Transaction volume data**: Annual transaction counts to determine compliance level
- **Current security controls inventory**: What you have in place (firewalls, encryption, logging, access controls)
- **Basic PCI DSS knowledge**: Understanding of the 12 requirements (review resources below)

**New to PCI DSS?** Complete the official [PCI DSS Quick Reference Guide](https://www.pcisecuritystandards.org/document_library/) before using these prompts.

## Tips for Success

**Scope minimization is key**: The less your network touches cardholder data, the easier compliance becomes. Use network segmentation, tokenization, and point-to-point encryption (P2PE) to minimize scope.

**Don't store unnecessary data**: Never store CAV2/CVC2/CVV2 values, PINs, or full magnetic stripe data. Minimize what you store and encrypt what you must retain.

**Implement compensating controls**: If you can't meet a requirement as written, document compensating controls that achieve the same security objective.

**Continuous compliance mindset**: v4.0 emphasizes ongoing monitoring vs. point-in-time compliance. Build continuous validation into your processes.

**Leverage validated solutions**: Use PA-DSS validated payment applications and PCI-listed service providers where possible to inherit compliance controls.

**Document everything**: Auditors need evidence. Document policies, procedures, configurations, logs, and reviews. Missing documentation is the most common audit failure.

## Resources

### Official PCI Security Standards Council Resources
- [PCI DSS v4.0 Documentation](https://www.pcisecuritystandards.org/document_library/) - Complete standard, summary of changes, and quick reference guide
- [PCI DSS Self-Assessment Questionnaires](https://www.pcisecuritystandards.org/document_library/) - All SAQ types (A, A-EP, B, B-IP, C, D)
- [Prioritized Approach Toolkit](https://www.pcisecuritystandards.org/document_library/) - Risk-based implementation guide

### Implementation Guides
- [PCI DSS v4.0 Roadmap](https://www.pcisecuritystandards.org/documents/PCI-DSS-v4-0-Roadmap-r1.pdf) - Migration guide from v3.2.1 to v4.0
- [Tokenization Guidelines](https://www.pcisecuritystandards.org/documents/Tokenization_Guidelines_Info_Supplement.pdf) - Using tokenization to reduce scope
- [Cloud Computing Guidelines](https://www.pcisecuritystandards.org/documents/PCI_DSS_v4-0_Cloud_Guidelines_r1.pdf) - PCI DSS in cloud environments

### Compliance Platforms
- [SecurityMetrics](https://www.securitymetrics.com/) - Scanning, SAQ assistance, and compliance management
- [Trustwave](https://www.trustwave.com/en-us/services/consulting/compliance/pci/) - QSA services and compliance consulting
- [ControlCase](https://www.controlcase.com/pci-dss-compliance/) - Compliance and audit services

### Comparison Resources
- [PCI DSS vs SOC 2](https://sprinto.com/blog/pci-dss-vs-soc-2/) - When to pursue each
- [PCI DSS vs ISO 27001](https://www.itgovernance.co.uk/blog/pci-dss-vs-iso-27001) - Overlapping controls

## Contributing

Have a PCI DSS prompt to contribute? Suggestions for improving existing prompts? See [../../CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.

**Particularly valuable contributions:**
- SAQ-specific prompts (Type A, A-EP, B, B-IP, C, D variants)
- Scoping and segmentation prompts
- Evidence collection checklists
- Requirement-specific implementation guides
- Compensating control documentation templates

## Changelog

- **2026-01-27**: Initial PCI DSS directory with Gap Analysis prompt (v4.0 aligned)
