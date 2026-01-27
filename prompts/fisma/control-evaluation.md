---
title: "FISMA Control Evaluation"
framework: "FISMA"
category: "Control Assessment"
version: "1.0"
framework_version: "FISMA 2014 / NIST 800-53 Rev 5"
last_updated: "2026-01-27"
author: "Community"
complexity: "Intermediate"
estimated_time: "15-20 minutes"
---

# FISMA Control Evaluation

## Description

This prompt guides you through a systematic evaluation of FISMA control implementation status using NIST 800-53 controls. It assesses whether controls are implemented correctly, identifies deficiencies and weaknesses, maps findings to Control Correlation Identifiers (CCIs), and provides risk-based remediation recommendations.

Use this prompt to conduct control assessments for FISMA compliance, prepare for assessments, or evaluate control effectiveness as part of continuous monitoring.

## Framework Context

**FISMA** (Federal Information Security Modernization Act) requires federal agencies and their contractors to implement information security programs. Compliance is achieved through the NIST Risk Management Framework (RMF), which uses NIST SP 800-53 security controls.

### Relationship to NIST 800-53

NIST 800-53 provides the catalog of security and privacy controls that federal systems must implement. The specific controls required depend on the system's FIPS 199 categorization (Low, Moderate, or High impact for Confidentiality, Integrity, and Availability).

### Control Families

NIST 800-53 organizes controls into 20 families:
- **AC** - Access Control
- **AT** - Awareness and Training
- **AU** - Audit and Accountability
- **CA** - Assessment, Authorization, and Monitoring
- **CM** - Configuration Management
- **CP** - Contingency Planning
- **IA** - Identification and Authentication
- **IR** - Incident Response
- **MA** - Maintenance
- **MP** - Media Protection
- **PE** - Physical and Environmental Protection
- **PL** - Planning
- **PM** - Program Management
- **PS** - Personnel Security
- **PT** - PII Processing and Transparency
- **RA** - Risk Assessment
- **SA** - System and Services Acquisition
- **SC** - System and Communications Protection
- **SI** - System and Information Integrity
- **SR** - Supply Chain Risk Management

### Assessment Methods

Control assessments use three methods (per NIST SP 800-53A):
- **Examine:** Review documentation, configurations, policies
- **Interview:** Discuss with personnel responsible for controls
- **Test:** Execute tests to verify control operation

## Prompt

```
<system>
System Name: {{SYSTEM_NAME}}
FIPS 199 Categorization: {{FIPS_CATEGORY}}
  - Confidentiality: Low / Moderate / High
  - Integrity: Low / Moderate / High
  - Availability: Low / Moderate / High
System Boundary: {{SYSTEM_BOUNDARY}}
</system>

<controls>
Controls to Evaluate: {{CONTROL_LIST}}
(Specify control IDs like "AC-2, AC-3, AU-2, AU-6, IA-2" or "all applicable controls for Moderate baseline")
</controls>

<instructions>
You are a FISMA control assessor conducting a control evaluation using NIST 800-53 Rev 5 controls. Perform a comprehensive assessment of the specified controls.

For each control:

1. **Assess Implementation Status**
   Determine the control's current state:
   - **Implemented:** Control is fully in place and operating as intended
   - **Partially Implemented:** Control exists but has gaps or weaknesses
   - **Planned:** Control implementation is documented in plan but not yet executed
   - **Not Implemented:** Control has not been implemented

2. **Identify Control Deficiencies and Weaknesses**
   Document specific gaps:
   - What control requirement is not met?
   - What evidence is missing?
   - What technical or procedural weakness exists?
   - Cite specific control statement requirements

3. **Map Findings to Control Correlation Identifiers (CCIs)**
   If applicable, map findings to CCIs from DISA STIGs or other CCI repositories. CCIs provide granular traceability from controls to specific requirements.

4. **Assess Risk Level of Deficiencies**
   For each deficiency, determine risk:
   - **High Risk:** Control failure could result in severe impact to mission, assets, or individuals. Immediate remediation required.
   - **Moderate Risk:** Control failure could result in significant impact. Remediation required within reasonable timeframe.
   - **Low Risk:** Control failure has limited impact. Remediation can be scheduled.

5. **Recommend Remediation Actions with Timeline**
   Provide specific, actionable remediation steps:
   - What needs to be implemented or fixed?
   - Who should be responsible?
   - What is the recommended timeline based on risk level?
   - Are there dependencies or prerequisites?

</instructions>

<output_format>
Provide the assessment in the following structure:

### Assessment Summary
- Total Controls Evaluated: X
- Implemented: X
- Partially Implemented: X
- Planned: X
- Not Implemented: X
- Overall Risk Level: High / Moderate / Low

### Control Assessment Table

| Control ID | Control Name | Status | Findings | Risk Level | Remediation | Timeline |
|------------|--------------|--------|----------|------------|-------------|----------|
| AC-2 | Account Management | Partial | Account review not automated; privileged accounts not logged separately | Moderate | Implement automated quarterly account reviews; configure separate audit logging for privileged accounts | 90 days |
| AU-2 | Audit Events | Implemented | All required events logged per AU-2(a-d) | - | None - maintain current implementation | - |
| ... | ... | ... | ... | ... | ... | ... |

### High-Risk Findings (Immediate Attention Required)

[Detailed description of any High-risk findings with specific remediation steps]

### Moderate-Risk Findings

[Detailed description of Moderate-risk findings]

### Low-Risk Findings

[Detailed description of Low-risk findings]

### Remediation Roadmap

**Phase 1 (0-30 days): High-Risk Items**
1. [Action item]
2. [Action item]

**Phase 2 (30-90 days): Moderate-Risk Items**
1. [Action item]
2. [Action item]

**Phase 3 (90+ days): Low-Risk Items**
1. [Action item]
2. [Action item]

### Continuous Monitoring Recommendations
[Suggestions for ongoing control monitoring]
</output_format>

<examples>
Example control assessments:

**AC-2: Account Management**

**Control Requirement (NIST 800-53 Rev 5):**
The organization:
a. Identifies and selects account types
b. Assigns account managers
c. Establishes conditions for group and role membership
d. Specifies authorized users, group/role memberships, and access authorizations
e. Requires approvals for account creation requests
f. Creates, enables, modifies, disables, and removes accounts per procedures
g. Monitors account use
h. Notifies account managers when accounts are no longer required
i. Authorizes access based on intended usage and other attributes
j. Reviews accounts for compliance with requirements [Assignment: frequency]
k. Establishes process for reissuing shared/group credentials when individuals are removed

**Assessment:**
- **Status:** Partially Implemented
- **Findings:**
  - (j) Account reviews occur annually but requirement is quarterly for privileged accounts
  - (g) Account monitoring exists but privileged account activity not logged separately
  - (k) No formal process documented for group credential reissuance
- **CCI Mapping:**
  - CCI-000015 (AC-2j): Account review frequency not met
  - CCI-001403 (AC-2(4)): Automated audit actions for privileged accounts not implemented
- **Risk Level:** Moderate
- **Remediation:**
  1. Update account management procedures to require quarterly privileged account reviews (30 days)
  2. Configure SIEM to alert on privileged account creation/modification/deletion (60 days)
  3. Document and implement group credential reissuance process (90 days)
- **Timeline:** 90 days

---

**AU-2: Audit Events**

**Control Requirement:**
The organization:
a. Identifies the types of events the system is capable of logging
b. Coordinates the event logging function with other organizational entities
c. Provides rationale for why event types are auditable
d. Reviews and updates audited events [Assignment: frequency]

**Assessment:**
- **Status:** Implemented
- **Findings:** None. System logs all AU-2a required events (successful/unsuccessful account logon, account management, object access, policy changes, privilege functions, process tracking, system events). Audit events reviewed and updated annually per organizational policy. Logging coordination documented with SOC.
- **Risk Level:** N/A (Control Satisfied)
- **Remediation:** None required. Maintain current implementation during continuous monitoring.
- **Timeline:** N/A
</examples>
```

## Usage Instructions

1. **Identify System and Controls:**
   - Know your system's FIPS 199 categorization (determines which controls apply)
   - Identify the specific controls you want to evaluate
   - For initial assessments, start with high-priority families: AC, IA, AU, SC

2. **Gather Evidence:**
   - System Security Plan (SSP) control descriptions
   - Configuration screenshots or exports
   - Policies and procedures
   - Audit logs or compliance reports
   - Interview notes from system administrators

3. **Fill in Variables:**
   - `{{SYSTEM_NAME}}`: Your federal information system name
   - `{{FIPS_CATEGORY}}`: Your system's impact levels (Low/Moderate/High for CIA)
   - `{{SYSTEM_BOUNDARY}}`: Brief description of what's included in the system
   - `{{CONTROL_LIST}}`: Specific controls to evaluate
   - `{{CURRENT_DOCUMENTATION}}`: Paste relevant SSP excerpts or evidence

4. **Run the Assessment:**
   Paste the prompt with filled variables and provide the evidence/documentation in the conversation.

5. **Review Findings:**
   The AI will provide a structured control assessment table with risk levels and remediation recommendations.

6. **Create POA&M:**
   Use the assessment findings to populate your Plan of Actions and Milestones (POA&M) for tracking remediation.

## Expected Output

### Sample Assessment Summary

```
**Assessment Summary**
- Total Controls Evaluated: 12
- Implemented: 7
- Partially Implemented: 4
- Planned: 1
- Not Implemented: 0
- Overall Risk Level: Moderate (4 moderate-risk findings, 0 high-risk)
```

### Sample Assessment Table

| Control ID | Control Name | Status | Findings | Risk | Remediation | Timeline |
|------------|--------------|--------|----------|------|-------------|----------|
| AC-2 | Account Management | Partial | Account review quarterly not met for privileged accounts | Moderate | Automate quarterly privileged account reviews | 90 days |
| AC-3 | Access Enforcement | Implemented | RBAC enforced via IAM policies | - | None | - |
| AU-2 | Audit Events | Implemented | All required events logged | - | None | - |
| AU-6 | Audit Review | Partial | No automated analysis; manual review only | Moderate | Implement SIEM automated alerting | 90 days |
| IA-2 | Identification and Authentication | Implemented | MFA enforced for all users | - | None | - |
| IA-5 | Authenticator Management | Partial | Password complexity enforced; no automated password expiration notification | Low | Configure 7-day password expiration notifications | 120 days |
| SC-7 | Boundary Protection | Implemented | Firewall rules documented and enforced | - | None | - |
| SC-8 | Transmission Confidentiality | Partial | TLS 1.2+ enforced; legacy protocol still enabled on one interface | Moderate | Disable TLS 1.0/1.1 on all interfaces | 60 days |

### Sample Remediation Roadmap

**Phase 1 (0-30 days): High-Risk Items**
- None identified (no High-risk findings)

**Phase 2 (30-90 days): Moderate-Risk Items**
1. SC-8: Disable TLS 1.0/1.1 on legacy interface (60 days)
2. AU-6: Implement SIEM automated alerting for critical events (90 days)
3. AC-2: Configure automated quarterly privileged account reviews (90 days)

**Phase 3 (90-120 days): Low-Risk Items**
1. IA-5: Configure automated password expiration notifications (120 days)

## Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `{{SYSTEM_NAME}}` | Federal information system name | "HR Records Management System (HRMS)" |
| `{{FIPS_CATEGORY}}` | FIPS 199 categorization | "Moderate-Moderate-Low (C-I-A)" |
| `{{SYSTEM_BOUNDARY}}` | System components and boundaries | "Web application, database server, user workstations" |
| `{{CONTROL_LIST}}` | Controls to evaluate | "AC-2, AC-3, AU-2, AU-6, IA-2, IA-5" |
| `{{CURRENT_DOCUMENTATION}}` | Evidence and SSP excerpts | [Paste SSP control descriptions] |

## Tips for Better Results

- **Focus on High-Impact Control Families:** FISMA assessors prioritize AC (Access Control), IA (Identification and Authentication), AU (Audit and Accountability), and SC (System and Communications Protection). Start here.

- **FISMA Uses Same Controls as FedRAMP:** FISMA and FedRAMP both use NIST 800-53. The main difference is FedRAMP is cloud-specific and has additional oversight. You can leverage FedRAMP assessments for FISMA compliance.

- **Evidence is Critical:** Assessors will ask for evidence. Don't just state "Implemented" - provide configuration screenshots, policy documents, or audit logs.

- **Continuous Monitoring is Required:** FISMA requires ongoing monitoring, not just initial assessment. Document how you'll continuously verify controls remain effective.

- **CCI Mapping Helps with DISA STIGs:** If your system uses DISA Security Technical Implementation Guides (STIGs), mapping findings to CCIs helps with traceability and automated scanning.

- **Tailor Controls Appropriately:** NIST 800-53 allows tailoring (adding, removing, or modifying controls) with proper justification. Document tailoring decisions in your SSP.

- **Coordinate with Authorizing Official:** The Authorizing Official (AO) or their designated representative makes the final authorization decision. Involve them early in the assessment process.

## Related Prompts

- **FedRAMP Compliance Assessment** - For cloud services requiring FedRAMP authorization
- **NIST 800-53 Control Mapping** - For mapping controls across frameworks

## Version History

- **1.0** (2026-01-27): Initial FISMA control evaluation prompt

## Sources

- [FISMA 2014](https://www.congress.gov/bill/113th-congress/senate-bill/2521) - Federal Information Security Modernization Act
- [NIST SP 800-53 Rev 5](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final) - Security and Privacy Controls
- [NIST SP 800-53A Rev 5](https://csrc.nist.gov/publications/detail/sp/800-53a/rev-5/final) - Assessing Security and Privacy Controls
- [NIST SP 800-37 Rev 2](https://csrc.nist.gov/publications/detail/sp/800-37/rev-2/final) - Risk Management Framework
- [FIPS 199](https://csrc.nist.gov/publications/detail/fips/199/final) - Standards for Security Categorization
