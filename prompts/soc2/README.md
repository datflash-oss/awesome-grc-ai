# SOC 2 Prompts

Prompts for SOC 2 compliance preparation, audit readiness, and control assessments.

## About SOC 2

SOC 2 (System and Organization Controls 2) is an auditing framework developed by the American Institute of Certified Public Accountants (AICPA) for service providers storing customer data in the cloud. SOC 2 compliance demonstrates that an organization has implemented robust controls to protect customer data and maintain system reliability.

### Trust Service Criteria

SOC 2 evaluates controls across five Trust Service Criteria (TSC):

- **Security (Common Criteria)**: Protection against unauthorized access, use, or modification of information. This is required for all SOC 2 audits and includes logical access controls, network security, change management, and risk assessment.

- **Availability**: System availability for operation and use as committed or agreed. Focuses on uptime, performance, incident management, and disaster recovery.

- **Processing Integrity**: System processing is complete, valid, accurate, timely, and authorized. Ensures data processing is accurate and delivered as intended.

- **Confidentiality**: Information designated as confidential is protected as committed or agreed. Goes beyond security to include data handling, disclosure, and disposal of sensitive information.

- **Privacy**: Personal information is collected, used, retained, disclosed, and disposed of properly. Aligned with privacy frameworks like GDPR, CCPA, and PIPEDA.

### SOC 2 Types

**Type I**: Point-in-time evaluation of control design. Auditors assess whether controls are appropriately designed at a specific date. Faster and less expensive, but less valuable as it doesn't test operational effectiveness.

**Type II**: Evaluation of control design AND operational effectiveness over a period (typically 3, 6, or 12 months). Auditors test that controls operated effectively throughout the audit period. This is the gold standard and what most customers require.

**Most organizations pursue Type II** as it demonstrates sustained compliance, not just properly documented controls.

## Available Prompts

### 1. [SOC 2 Audit Preparation Checklist](./audit-preparation.md)
**Use case**: Preparing for upcoming SOC 2 Type I or Type II audit
**Complexity**: Beginner
**Time**: 10-15 minutes
**Output**: Timeline-based checklist organized by 90/60/30 days and 1 week milestones, with evidence requirements and risk flags

**When to use**: 3-6 months before planned audit date to build preparation roadmap and assign responsibilities.

### 2. SOC 2 Control Gap Analysis *(Coming soon)*
**Use case**: Identifying gaps in current control implementation against TSC requirements
**Complexity**: Intermediate
**Time**: 20-25 minutes
**Output**: Gap assessment table with remediation priorities, effort estimates, and control mappings

### 3. SOC 2 Evidence Collection Tracker *(Coming soon)*
**Use case**: Generating evidence requirements list for Type II audit periods
**Complexity**: Beginner
**Time**: 10 minutes
**Output**: Evidence collection checklist with descriptions, owners, and collection cadence

## How to Use These Prompts

1. **Choose the right prompt** for your current compliance stage:
   - Starting SOC 2 journey? → Audit Preparation Checklist
   - Have controls documented? → Control Gap Analysis
   - In audit period? → Evidence Collection Tracker

2. **Read the framework context** in each prompt file to understand which Trust Service Criteria apply to your organization.

3. **Gather required information** (see Variables section in each prompt):
   - Organization name, industry, and service description
   - Target audit date and type (Type I or Type II)
   - Current control state and documentation
   - Scope (which TSC you're pursuing)

4. **Copy the prompt** from the code block in the prompt file.

5. **Replace variables** with your organization's details (find-replace `{{VARIABLE_NAME}}`).

6. **Paste into Claude** and wait 10-30 seconds for output.

7. **Customize results** for your environment. Add organization-specific controls, adjust timelines based on resources, validate against AICPA Trust Service Criteria documentation.

## Prerequisites

Before using these prompts, ensure you have:

- **Basic SOC 2 knowledge**: Understanding of Trust Service Criteria and Type I vs Type II differences
- **Scope definition**: Which Trust Service Criteria you're pursuing (Security is required; others are optional based on customer requirements)
- **Control inventory**: At least a rough understanding of controls you currently have in place
- **Stakeholder buy-in**: SOC 2 preparation requires cross-functional effort (engineering, security, HR, legal)

**New to SOC 2?** Review the resources below before using prompts.

## Tips for Success

**Define scope early**: Not all five Trust Service Criteria may be relevant. Most organizations start with Security + Availability. Privacy is only needed if you process personal information. Confidentiality applies to specific types of sensitive data.

**Start Type II early**: The clock starts when you begin your audit period. If you're planning a 6-month Type II audit, ensure controls are operating before the period begins.

**Document everything**: Type II audits require evidence that controls operated throughout the period. Set up logging, screenshots, approvals, and reviews from day one.

**Assign owners**: Each control needs a responsible party. Use prompt outputs to identify owners early and ensure they understand their responsibilities.

**Use templates**: Standardize how you document controls, collect evidence, and perform reviews. Consistency makes audits faster and cheaper.

**Consider automation**: Many SOC 2 controls can be automated (access reviews, log collection, change management). Automation platforms like Vanta, Drata, or Secureframe can reduce manual effort.

## Resources

### Official AICPA Resources
- [AICPA SOC 2 Overview](https://us.aicpa.org/interestareas/frc/assuranceadvisoryservices/aicpasoc2report) - Official framework documentation
- [Trust Service Criteria](https://us.aicpa.org/content/dam/aicpa/interestareas/frc/assuranceadvisoryservices/downloadabledocuments/trust-services-criteria.pdf) - Complete TSC specifications (2017 version)

### Guides and Explanations
- [Vanta SOC 2 Compliance Guide](https://vanta.com/resources/soc-2-compliance-guide) - Comprehensive preparation guide
- [Secureframe SOC 2 Requirements](https://secureframe.com/hub/soc-2/requirements) - Breakdown of requirements by TSC
- [Laika SOC 2 Checklist](https://www.laikacloud.com/hub/soc-2-checklist) - Detailed checklist format

### Comparison Guides
- [SOC 2 vs ISO 27001](https://secureframe.com/hub/soc-2/vs-iso-27001) - When to pursue each
- [SOC 2 vs PCI DSS](https://sprinto.com/blog/pci-dss-vs-soc-2/) - Overlaps and differences

## Contributing

Have a SOC 2 prompt to contribute? Suggestions for improving existing prompts? See [../../CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.

**Particularly valuable contributions:**
- Prompts for specific industries (healthcare, fintech, SaaS)
- Evidence collection automation scripts
- Control implementation examples
- Type II vs Type I comparison prompts

## Changelog

- **2026-01-27**: Initial SOC 2 directory with Audit Preparation Checklist prompt
