# AI Governance Policy Templates

Ready-to-customize policy templates for AI governance and compliance. These templates provide comprehensive starting points that GRC practitioners can adapt for their organizations, covering AI acceptable use, risk assessment, and model development lifecycle governance.

## Available Templates

| Template | Purpose | Complexity | Customization Time |
|----------|---------|------------|-------------------|
| [AI Acceptable Use Policy](./ai-acceptable-use-policy.md) | Define acceptable and prohibited AI usage across organization | Intermediate | 2-4 hours |
| [AI Risk Assessment Framework](./ai-risk-assessment-framework.md) | Establish AI risk identification, assessment, and management process | Advanced | 4-6 hours |
| [Model Development Lifecycle](./model-development-lifecycle.md) | Implement governance checkpoints across ML model development stages | Advanced | 3-5 hours |

## How to Use These Templates

### Step 1: Download or Copy the Template

Navigate to the template you need and download the raw Markdown file, or copy the content directly.

```bash
# Clone the repository
git clone https://github.com/yourusername/awesome-grc-ai.git

# Navigate to templates
cd awesome-grc-ai/templates

# Copy template to your workspace
cp ai-acceptable-use-policy.md /path/to/your/policies/
```

### Step 2: Replace {{VARIABLE}} Placeholders

Each template uses `{{VARIABLE}}` format for customizable elements. All variables are documented in the YAML frontmatter with descriptions, examples, and whether they're required.

**Common variables across templates:**
- `{{ORGANIZATION_NAME}}` - Your organization's legal name
- `{{EFFECTIVE_DATE}}` - Date when policy becomes effective
- `{{POLICY_OWNER}}` - Name/title of policy owner
- `{{APPROVER}}` - Name/title of approving authority

**Find all variables in a template:**
```bash
grep -oE '\{\{[A-Z_]+\}\}' ai-acceptable-use-policy.md | sort -u
```

**Replace variables manually or with find-replace in your editor:**
- VS Code: Cmd/Ctrl + H for find and replace
- Command line: `sed 's/{{ORGANIZATION_NAME}}/Acme Corp/g' template.md > customized.md`

### Step 3: Review and Customize Sections

Templates include comprehensive guidance with concrete examples. Customize for your organization:

1. **Review each section** - Remove sections that don't apply to your organization
2. **Adjust specificity** - Add organization-specific details where indicated
3. **Select alternatives** - Templates often provide alternative clauses (e.g., "If you process PII..." vs "If you process only non-sensitive data...")
4. **Add context** - Include references to existing policies, systems, or tools
5. **Tailor examples** - Replace example scenarios with real use cases from your organization

**Sections to always customize:**
- Scope: Define which systems, users, and data are covered
- Approved Tools: Replace example tools with your actual approved AI systems
- Risk Tolerance: Adjust risk thresholds to match organizational appetite
- Roles and Responsibilities: Map to your actual org chart and governance structure
- Training Requirements: Align with existing training programs

### Step 4: Route Through Approval Process

These templates require formal approval before implementation:

1. **Legal Review** - Have legal counsel review for regulatory compliance
2. **Privacy Review** - If template covers data handling, engage privacy team
3. **Security Review** - Have InfoSec review security controls and requirements
4. **Executive Approval** - Route to appropriate executive authority (CIO, CISO, Legal, Board)
5. **Communication** - Plan rollout communication and training
6. **Version Control** - Store approved policy in document management system with version history

## Template Structure

### YAML Frontmatter

Each template begins with YAML frontmatter (between `---` markers) containing metadata:

```yaml
---
title: "AI Acceptable Use Policy"
type: "Policy"
version: "1.0"
framework_alignment:
  - "NIST AI RMF 1.0"
  - "ISO/IEC 42001:2023"
last_updated: "2026-01-27"
complexity: "Intermediate"
variables:
  - name: "ORGANIZATION_NAME"
    description: "Legal name of your organization"
    required: true
    example: "Acme Corporation"
---
```

**Key metadata fields:**
- **framework_alignment**: Which compliance frameworks this template supports
- **complexity**: Intermediate (basic AI governance) or Advanced (complex risk management)
- **estimated_customization_time**: Expected time to fully customize
- **variables**: Complete list of all `{{VARIABLE}}` placeholders with descriptions

### Document Sections

Templates follow standard policy document structure:

1. **Document Control** - Metadata table (organization, version, owner, approver, effective date)
2. **Purpose and Scope** - Why policy exists, what it covers, who it applies to
3. **Definitions** - Key terms used throughout the policy
4. **Core Content** - Main policy requirements (varies by template)
5. **Roles and Responsibilities** - Who is accountable for what
6. **Compliance and Enforcement** - How policy is monitored and violations handled
7. **Policy Maintenance** - Review cycle and update process

### Variable Placeholder Convention

Variables use uppercase letters with underscores: `{{ORGANIZATION_NAME}}`

This format:
- Is visually distinct (stands out when reviewing)
- Won't accidentally match real content
- Works with simple find-replace tools
- Is searchable (find remaining variables: `grep -E '\{\{[A-Z_]+\}\}'`)

## Framework Alignment

These templates are designed to support compliance with multiple AI governance frameworks:

### NIST AI Risk Management Framework (AI RMF 1.0)

The NIST AI RMF provides a voluntary framework for managing AI risks organized into four functions:

- **GOVERN**: Establish AI governance structure, policies, and accountability (→ AI Acceptable Use Policy)
- **MAP**: Identify and categorize AI systems, use cases, and context (→ AI Risk Assessment Framework)
- **MEASURE**: Assess AI risks using appropriate methods and metrics (→ AI Risk Assessment Framework)
- **MANAGE**: Mitigate AI risks and monitor effectiveness (→ Model Development Lifecycle)

**Templates mapping:**
- AI Acceptable Use Policy → GOVERN function (governance structure, policies, roles)
- AI Risk Assessment Framework → MAP and MEASURE functions (risk identification, assessment process)
- Model Development Lifecycle → MANAGE function (controls across development stages)

### ISO/IEC 42001:2023 - AI Management System

ISO 42001 is the first international standard for AI management systems, providing requirements for establishing, implementing, maintaining, and continually improving an AI management system.

**Key requirements covered by templates:**
- Clause 5.2: AI management system policy (→ AI Acceptable Use Policy)
- Clause 6.1: Risk assessment and treatment (→ AI Risk Assessment Framework)
- Clause 8.1: Operational planning and control (→ Model Development Lifecycle)
- Clause 8.2: AI system development/acquisition (→ Model Development Lifecycle)

### EU AI Act

The EU AI Act establishes risk-based requirements for AI systems marketed or used in the EU.

**Risk categories addressed:**
- **High-risk AI systems**: Templates include controls for high-risk applications (safety, fundamental rights)
- **Transparency obligations**: AI Acceptable Use Policy includes disclosure requirements
- **Data governance**: AI Risk Assessment Framework covers data quality requirements
- **Human oversight**: Model Development Lifecycle includes human-in-the-loop checkpoints

**Templates support:**
- Article 9: Risk management system (→ AI Risk Assessment Framework)
- Article 10: Data governance (→ AI Risk Assessment Framework, Model Development Lifecycle)
- Article 11: Technical documentation (→ Model Development Lifecycle)
- Article 14: Human oversight (→ AI Acceptable Use Policy, Model Development Lifecycle)

### Framework Comparison

| Framework | Type | Geographic Scope | Templates Coverage |
|-----------|------|------------------|-------------------|
| NIST AI RMF 1.0 | Voluntary guidance | Global (US-developed) | All templates map to GOVERN/MAP/MEASURE/MANAGE |
| ISO/IEC 42001:2023 | Certification standard | Global | Templates cover policy, risk, and operational requirements |
| EU AI Act | Legal regulation | European Union | Templates provide controls for high-risk systems |

**Using templates for multi-framework compliance:**

1. Start with NIST AI RMF structure (most comprehensive guidance)
2. Add ISO 42001 documentation requirements (audit trail, records)
3. Layer in EU AI Act specifics if deploying in EU (conformity assessment, CE marking)

Templates include `framework_alignment` in frontmatter showing which frameworks each section addresses.

## Prerequisites

Before using these templates, ensure you have:

### Basic AI Governance Knowledge

- Understanding of AI terminology (ML, generative AI, large language models)
- Familiarity with AI risks (bias, privacy, security, transparency)
- Basic awareness of AI regulatory landscape (NIST AI RMF, EU AI Act, ISO 42001)

**Recommended background reading:**
- [NIST AI RMF 1.0](https://www.nist.gov/itl/ai-risk-management-framework) - Core framework understanding
- [ISO/IEC 42001:2023 Overview](https://www.iso.org/standard/81230.html) - AI management system standard
- See [AI Governance Frameworks](../README.md#ai-governance-frameworks) in main README for learning resources

### Organizational Context

You'll need to know:
- How AI is currently used in your organization (systems, use cases, users)
- Organizational risk tolerance and appetite
- Existing governance structures (committees, reporting lines, approval processes)
- Relevant regulatory requirements for your industry (healthcare, finance, etc.)
- Current policies that need integration (security policy, data governance policy, acceptable use policy)

### Stakeholder Engagement

Policy development requires input from:
- **Legal/Compliance**: Regulatory requirements, legal language, approval authority
- **Information Security**: Security controls, threat modeling
- **Privacy/Data Governance**: Data handling requirements, privacy controls
- **Business Units**: Use case requirements, operational feasibility
- **IT/Engineering**: Technical implementation feasibility
- **Executive Leadership**: Risk tolerance, strategic direction, final approval

## Contributing to Templates

Found an issue or have a suggestion? See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines on:
- Reporting template issues
- Suggesting improvements
- Contributing new templates
- Sharing customization examples

## Related Resources

- **[Prompts Library](../prompts/README.md)**: AI-powered assistance for using these templates (e.g., "Generate risk scenarios for my AI Acceptable Use Policy")
- **[Main README](../README.md)**: Full awesome-grc-ai resource list
- **[AI Governance Frameworks](../README.md#ai-governance-frameworks)**: Learn about NIST AI RMF, ISO 42001, EU AI Act
- **[Scripts](../scripts/README.md)**: Automation scripts for compliance evidence collection

## License

All templates in this directory are provided under the project's license. See [LICENSE](../LICENSE) for details.

Templates are provided as-is for informational purposes. They should be reviewed by qualified legal counsel before adoption. The maintainers make no warranties about the suitability of these templates for any particular purpose.
