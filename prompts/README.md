# GRC Prompt Library

A curated collection of Claude-optimized prompts for GRC compliance workflows. These prompts help practitioners generate actionable outputs for common compliance tasks: audit preparation, gap analysis, control assessments, and risk evaluations.

## Why This Library

Most compliance work involves repetitive analysis and documentation tasks. These prompts transform Claude into a specialized GRC assistant that produces ready-to-use deliverables: checklists, gap analyses, risk registers, and control mappings. Each prompt is structured with XML tags for optimal Claude performance, includes clear variable documentation, and specifies exact output formats.

**Key features:**
- **Copy-paste ready**: No prompt engineering experience required
- **Actionable outputs**: Checklists, tables, and assessments ready to share with auditors
- **Variable templates**: Replace `{{VARIABLES}}` with your organization details
- **Framework-specific**: Optimized for each compliance framework's requirements
- **Version-tracked**: YAML frontmatter tracks prompt and framework versions

## Available Framework Prompts

### [SOC 2](./soc2/)
Prompts for SOC 2 Type I and Type II compliance across five Trust Service Criteria (Security, Availability, Processing Integrity, Confidentiality, Privacy).

**Available prompts:**
- **Audit Preparation Checklist**: Timeline-based preparation tasks organized by 90/60/30 days and 1 week milestones

**Use cases**: Preparing for SOC 2 audits, evidence collection, control validation

### [PCI DSS](./pci-dss/)
Prompts for PCI DSS v4.0 compliance covering all 12 requirements for cardholder data protection.

**Available prompts:**
- **Gap Analysis**: Identify compliance gaps with risk-level assessments and remediation timelines

**Use cases**: PCI DSS gap assessments, compliance roadmap planning, audit preparation

### [FedRAMP](./fedramp/)
Prompts for FedRAMP authorization using NIST 800-53 control framework.

**Available prompts:**
- **Compliance Assessment**: Evaluate FedRAMP authorization readiness with control gap analysis for Moderate baseline

**Use cases**: FedRAMP authorization preparation, NIST 800-53 control documentation

### [FISMA](./fisma/)
Prompts for FISMA compliance and Authority to Operate (ATO) processes using NIST 800-53.

**Available prompts:**
- **Control Evaluation**: Evaluate NIST 800-53 control implementation status with evidence tracking

**Use cases**: Federal system compliance, ATO preparation, NIST 800-53 assessments

### [NIST AI RMF](./nist-ai-rmf/)
Prompts for AI Risk Management Framework compliance across four functions: Govern, Map, Measure, Manage.

**Available prompts:**
- **Risk Assessment**: Comprehensive AI risk assessment across all four RMF functions with detailed risk register

**Use cases**: AI system risk assessments, AI governance documentation, trustworthy AI validation

## How to Use These Prompts

### Step 1: Choose Your Prompt
Browse the framework directories above and select the prompt matching your compliance task.

### Step 2: Read the Framework Context
Each prompt file includes background on the framework and when to use the prompt. Review this section to ensure it matches your needs.

### Step 3: Gather Required Information
Check the "Variables" section in the prompt file to see what information you need. Common variables include:
- Organization name and description
- System architecture and data flows
- Current control implementations
- Timeline and scope requirements

### Step 4: Copy and Replace Variables
Copy the prompt from the "Prompt" section (the code block with XML tags). Replace all `{{VARIABLES}}` with your specific information.

### Step 5: Paste into Claude
Paste the customized prompt into Claude (claude.ai or API). Wait 10-30 seconds for comprehensive output.

### Step 6: Review and Customize
Claude's output is a starting point. Review for accuracy, add organization-specific details, validate against your actual environment, and customize formatting as needed.

### Step 7: Iterate
Run prompts multiple times as your compliance program evolves. Track prompt versions in YAML frontmatter to maintain consistency.

## Tips for Success

**Be specific with context:** The more detailed your variable substitutions, the better Claude's output. Instead of "financial services company", provide "B2B SaaS platform processing ACH transactions for 500+ SMB customers".

**Validate outputs:** Always review Claude's output with compliance professionals or auditors. These prompts accelerate work but don't replace expert judgment.

**Iterate on prompts:** If output isn't quite right, refine your variable inputs or add additional context in `<context>` tags.

**Track versions:** Note the prompt version and framework version in your deliverables. Frameworks update regularly (PCI DSS annually, NIST reviews every 3 years).

**Use prompt chaining:** For complex workflows, run multiple prompts in sequence. Example: PCI DSS gap analysis → prioritize top gaps → generate remediation plan.

**Customize output formats:** If you need JSON instead of Markdown, or different table structures, modify the `<output_format>` section.

## Prerequisites

Before using these prompts:

- **Claude access**: These prompts are optimized for Claude 3.5+ (claude.ai or API). They may work with other LLMs but are not optimized for them.
- **Framework knowledge**: Basic understanding of the compliance framework you're working with. Each framework directory includes context, but these prompts assume foundational knowledge.
- **Current state documentation**: Most prompts require information about your existing controls, systems, and processes. Gather this before running prompts.
- **Text editor**: For variable substitution before pasting into Claude.

## Contributing

Found a bug in a prompt? Have an idea for a new prompt? Want to add support for another framework?

See [../CONTRIBUTING.md](../CONTRIBUTING.md) for:
- How to propose new prompts
- Prompt quality standards
- Testing and validation process
- Framework version maintenance

Contributions welcome! This is a community-driven library.

## Related Resources

- **[Main README](../README.md)**: Overview of awesome-grc-ai project
- **[Tools & Platforms](../README.md#tools--platforms)**: GRC tools with AI capabilities
- **[Learning Resources](../README.md#learning-resources)**: Training and certifications for GRC + AI

## License

Prompts are licensed under CC0 1.0 Universal (public domain). Use freely in commercial and personal projects. See [../LICENSE](../LICENSE) for details.

## Disclaimer

These prompts provide general compliance guidance and should not be considered legal or audit advice. Always consult with qualified compliance professionals, auditors, and legal counsel for your specific situation. Framework requirements vary by organization size, industry, and jurisdiction.

Prompt outputs are AI-generated and may contain errors. Verify all information before using in official compliance documentation or audit submissions.
