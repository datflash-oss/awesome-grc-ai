---
title: "SOC 2 Audit Preparation Checklist"
framework: "SOC 2"
category: "Audit"
version: "1.0"
framework_version: "2017 Trust Services Criteria"
last_updated: "2026-01-27"
author: "Community"
complexity: "Beginner"
estimated_time: "10-15 minutes"
tested_with: "Claude 3.5 Sonnet+"
---

## Description

Generates a comprehensive, timeline-based audit preparation checklist for SOC 2 Type I or Type II compliance. The output organizes preparation tasks by timeline milestones (90 days, 60 days, 30 days, 1 week before audit), flags high-risk items requiring immediate attention, specifies evidence requirements for each task, and recommends responsible parties.

**When to use this prompt:**
- 3-6 months before planned SOC 2 audit kickoff
- When transitioning from Type I to Type II
- When expanding scope to additional Trust Service Criteria
- Annual audit preparation for recurring SOC 2 engagements

**What this prompt does:**
- Breaks down audit preparation into manageable timeline-based tasks
- Identifies evidence collection requirements for each control area
- Flags high-risk gaps that could delay or fail audit
- Maps tasks to typical organizational roles (engineering, security, HR, legal)
- Customizes recommendations based on your Trust Service Criteria scope

## Framework Context

SOC 2 (System and Organization Controls 2) is an AICPA framework for service organizations storing customer data. It evaluates controls across five Trust Service Criteria:

- **Security (Required)**: Unauthorized access protection
- **Availability**: System uptime and performance
- **Processing Integrity**: Accurate and complete data processing
- **Confidentiality**: Protection of confidential information
- **Privacy**: Personal information handling

**Type I** audits assess control design at a point in time. **Type II** audits test operational effectiveness over 3-12 months (most common and valuable).

Audits typically take 4-8 weeks from kickoff to report issuance. Preparation should begin 3-6 months prior to ensure controls are operating and evidence exists.

## Prompt

Copy and paste this prompt into Claude, after replacing the variables:

```
You are a SOC 2 compliance expert helping organizations prepare for Type I or Type II audits.

<organization>
Organization name: {{ORGANIZATION_NAME}}
Industry: {{INDUSTRY}}
Service description: {{SERVICE_DESCRIPTION}}
Audit type: {{AUDIT_TYPE}}
Target audit date: {{AUDIT_DATE}}
Trust Service Criteria in scope: {{TSC_SCOPE}}
Current control state: {{CURRENT_CONTROLS}}
Team size: {{TEAM_SIZE}}
</organization>

<instructions>
Generate a comprehensive SOC 2 audit preparation checklist based on the organization details provided.

**Requirements:**
1. Organize tasks by timeline milestones: 90 days out, 60 days out, 30 days out, 1 week out
2. Include all Trust Service Criteria in scope (Security is always included)
3. For each task, specify:
   - Task description (actionable and specific)
   - Risk level (🔴 Critical, 🟡 High, 🟢 Medium, ⚪ Low)
   - Evidence requirements (what auditor will request)
   - Recommended owner (role, not individual name)
   - Estimated effort (hours or days)
4. Flag 🔴 Critical items that are audit blockers if not completed
5. Include both technical controls (access management, encryption, logging) and operational controls (policies, training, vendor management)
6. Address Type II-specific requirements if applicable (continuous evidence collection, periodic reviews)
7. Include preparation for auditor interviews and walkthroughs

**Focus areas to cover:**
- Information security policies and procedures
- Access control (user provisioning, MFA, least privilege)
- Network security (firewalls, segmentation, monitoring)
- Change management (testing, approvals, rollback)
- Incident response and business continuity
- Risk assessment process
- Vendor management and third-party risk
- Data classification and handling
- Physical security (if applicable)
- HR security (background checks, onboarding/offboarding, training)
- Monitoring and logging
- Encryption (data at rest and in transit)
</instructions>

<output_format>
Return a structured checklist in Markdown format:

# SOC 2 Audit Preparation Checklist
**Organization:** {{ORGANIZATION_NAME}}
**Audit Type:** {{AUDIT_TYPE}}
**Target Audit Date:** {{AUDIT_DATE}}
**Scope:** {{TSC_SCOPE}}

---

## 90 Days Before Audit

### 1. [Task Title]
- **Risk:** [🔴/🟡/🟢/⚪] [Risk Level]
- **Description:** [Detailed task description]
- **Evidence Required:** [What auditor needs to see]
- **Owner:** [Responsible role]
- **Effort:** [Time estimate]
- **Notes:** [Additional context or dependencies]

### 2. [Task Title]
[Same structure]

[Continue for all 90-day tasks]

---

## 60 Days Before Audit

[Same structure as 90-day section]

---

## 30 Days Before Audit

[Same structure]

---

## 1 Week Before Audit

[Same structure]

---

## During Audit

[Audit week preparation tasks]

---

## Summary
- **Total tasks:** [Count]
- **Critical items:** [Count and brief list]
- **Estimated total effort:** [Hours/days]
- **Key dependencies:** [Major blockers or sequencing requirements]

## Next Steps
1. [Immediate action 1]
2. [Immediate action 2]
3. [Immediate action 3]
</output_format>
```

## Usage Instructions

### Step 1: Gather Organization Information

Before using the prompt, collect:

- **Organization name and industry**: For context and industry-specific considerations
- **Service description**: What your product/service does (1-2 sentences)
- **Audit type**: Type I (point-in-time) or Type II (3/6/12-month period)
- **Target audit date**: When you plan to start the audit
- **TSC scope**: Which Trust Service Criteria (Security + which others?)
- **Current control state**: Brief assessment of where you are (e.g., "policies drafted, some controls implemented, no evidence collection yet")
- **Team size**: Approximate number of people available for compliance work

### Step 2: Replace Variables

Copy the prompt above and replace all `{{VARIABLES}}` with your information:

- `{{ORGANIZATION_NAME}}`: Your company name
- `{{INDUSTRY}}`: Your industry (SaaS, fintech, healthcare, etc.)
- `{{SERVICE_DESCRIPTION}}`: Brief description of your service
- `{{AUDIT_TYPE}}`: "SOC 2 Type I" or "SOC 2 Type II"
- `{{AUDIT_DATE}}`: Target date (e.g., "July 2026")
- `{{TSC_SCOPE}}`: List criteria (e.g., "Security, Availability, Confidentiality")
- `{{CURRENT_CONTROLS}}`: Brief current state (e.g., "Policies documented, technical controls partially implemented, limited evidence")
- `{{TEAM_SIZE}}`: Number of people (e.g., "5-person engineering team, 1 security lead, no dedicated compliance staff")

### Step 3: Paste into Claude

Paste your customized prompt into Claude (claude.ai or API). Wait 15-30 seconds for comprehensive output.

### Step 4: Review and Customize

Claude will generate a detailed checklist. Review and adjust:

- **Validate timelines**: Adjust based on your actual resources and constraints
- **Add organization-specific items**: Include any unique controls or requirements
- **Assign actual owners**: Replace role placeholders with real names and confirm availability
- **Prioritize**: If timeline is compressed, focus on 🔴 Critical and 🟡 High items first
- **Check evidence**: Confirm you can actually collect the evidence specified

### Step 5: Track Progress

Export the checklist to your project management tool (Jira, Asana, etc.) and track completion. Schedule weekly reviews to ensure timeline adherence.

## Expected Output

A comprehensive 10-20 page checklist document with:

- **50-100 tasks** organized by timeline (fewer for Type I, more for Type II)
- **Risk flags** on all items (🔴 Critical items are audit blockers)
- **Evidence specifications** for each control area (policies, screenshots, logs, reports)
- **Role assignments** mapping tasks to typical org roles
- **Effort estimates** for resource planning
- **Summary section** with total effort and critical path items
- **Next steps** with immediate actions to start

**Example task entry:**

```markdown
### 3. Implement Multi-Factor Authentication (MFA)
- **Risk:** 🔴 Critical
- **Description:** Deploy MFA for all user accounts with administrative privileges and access to production systems. Configure MFA policy to require authentication at least every 30 days.
- **Evidence Required:** MFA configuration screenshots, MFA enrollment report showing 100% compliance, MFA audit logs for sample period
- **Owner:** Security Team / IT Administrator
- **Effort:** 2-3 days (includes deployment, testing, user communication, and documentation)
- **Notes:** BLOCKER if not completed. Auditors will test MFA during control walkthroughs. Consider phased rollout: admins first, then all employees. Document exceptions with business justification.
```

## Variables

| Variable | Description | Required | Example |
|----------|-------------|----------|---------|
| `{{ORGANIZATION_NAME}}` | Your organization's legal name | Yes | "Acme SaaS Inc." |
| `{{INDUSTRY}}` | Industry or sector | Yes | "B2B SaaS", "Fintech", "Healthcare Technology" |
| `{{SERVICE_DESCRIPTION}}` | What your product/service does | Yes | "Cloud-based project management platform for enterprise customers" |
| `{{AUDIT_TYPE}}` | Type I or Type II audit | Yes | "SOC 2 Type II" |
| `{{AUDIT_DATE}}` | Target audit start date | Yes | "October 2026" |
| `{{TSC_SCOPE}}` | Trust Service Criteria in scope | Yes | "Security, Availability" or "Security, Availability, Confidentiality" |
| `{{CURRENT_CONTROLS}}` | Brief assessment of current state | Yes | "Policies documented, MFA enabled, quarterly access reviews in place, incident response plan drafted but not tested" |
| `{{TEAM_SIZE}}` | Resources available for compliance work | No (but recommended) | "8-person engineering team, 2 security engineers, 1 IT admin, no dedicated GRC staff" |

**Tips for variable values:**
- **CURRENT_CONTROLS**: Be honest. Better to identify gaps now than during audit.
- **TSC_SCOPE**: Start with Security + Availability unless customers specifically require others. Privacy requires significant additional effort.
- **TEAM_SIZE**: Helps Claude calibrate effort estimates and task delegation.

## Tips for Better Results

**Run this prompt early**: 3-6 months before audit gives you time to implement controls and collect evidence. Running 30 days before audit will generate a realistic checklist but may not be achievable.

**Be specific about current state**: The more detail you provide in `{{CURRENT_CONTROLS}}`, the better Claude can identify gaps vs. reinforcing existing work.

**Iterate as you progress**: Run the prompt again at 90, 60, and 30-day marks with updated current state. Claude will adjust recommendations based on progress.

**Combine with gap analysis prompt**: Use this for timeline planning, then use SOC 2 Control Gap Analysis prompt for detailed control-by-control assessment.

**Consider automation platforms**: If this checklist feels overwhelming, consider SOC 2 automation platforms (Vanta, Drata, Secureframe) that provide continuous control monitoring and evidence collection.

**Involve your auditor early**: Share the checklist with your audit firm to confirm no missing items and get feedback on evidence requirements.

## Related Prompts

- [SOC 2 Control Gap Analysis](./control-gap-analysis.md) *(Coming soon)* - Detailed control-by-control assessment
- [SOC 2 Evidence Collection Tracker](./evidence-tracker.md) *(Coming soon)* - Evidence requirements for Type II audit period

## Changelog

- **v1.0** (2026-01-27): Initial release based on 2017 Trust Services Criteria

## Sources

- [AICPA Trust Services Criteria](https://us.aicpa.org/content/dam/aicpa/interestareas/frc/assuranceadvisoryservices/downloadabledocuments/trust-services-criteria.pdf)
- [Vanta SOC 2 Compliance Guide](https://vanta.com/resources/soc-2-compliance-guide)
- [Secureframe SOC 2 Requirements](https://secureframe.com/hub/soc-2/requirements)
