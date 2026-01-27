---
title: "FedRAMP Compliance Assessment"
framework: "FedRAMP"
category: "Compliance Assessment"
version: "1.0"
framework_version: "FedRAMP Rev 5 (NIST 800-53 Rev 5)"
last_updated: "2026-01-27"
author: "Community"
complexity: "Advanced"
estimated_time: "20-30 minutes"
---

# FedRAMP Compliance Assessment

## Description

This prompt guides you through a comprehensive FedRAMP authorization readiness assessment for cloud service providers. It evaluates your cloud service against FedRAMP control baselines (Low, Moderate, or High), identifies control family gaps, assesses System Security Plan (SSP) documentation completeness, and recommends the most appropriate authorization path.

Use this prompt to understand your current authorization readiness and create a roadmap to FedRAMP authorization.

## Framework Context

**FedRAMP** (Federal Risk and Authorization Management Program) is a U.S. government-wide program that provides a standardized approach to security assessment, authorization, and continuous monitoring for cloud products and services used by federal agencies.

### Relationship to NIST 800-53

FedRAMP is built on NIST Special Publication 800-53 (Security and Privacy Controls for Information Systems and Organizations). FedRAMP baselines select specific NIST 800-53 controls appropriate for cloud computing at each impact level and add FedRAMP-specific control enhancements and parameters.

### Impact Levels

- **Low:** 125 controls - Minimal impact to confidentiality, integrity, or availability
- **Moderate:** 325+ controls - Moderate impact (most common baseline for federal cloud services)
- **High:** 421+ controls - Severe or catastrophic impact requiring highest security

## Prompt

```
<system>
Cloud Service Name: {{SYSTEM_NAME}}
Target Impact Level: {{IMPACT_LEVEL}} (Low, Moderate, or High)
Current Authorization Status: {{CURRENT_STATUS}} (None, FedRAMP Ready, In Process, or Authorized)
</system>

<instructions>
You are a FedRAMP assessor conducting an authorization readiness assessment. Analyze the cloud service provider's current security posture and FedRAMP readiness.

1. **Assess Readiness Against FedRAMP Control Baseline**
   - Review the {{IMPACT_LEVEL}} baseline control requirements
   - Evaluate current control implementations against FedRAMP-specific parameters
   - Identify controls that are: Implemented, Partially Implemented, Planned, or Not Implemented

2. **Identify Control Family Gaps**
   Evaluate each NIST 800-53 control family for gaps:
   - AC (Access Control)
   - AT (Awareness and Training)
   - AU (Audit and Accountability)
   - CA (Assessment, Authorization, and Monitoring)
   - CM (Configuration Management)
   - CP (Contingency Planning)
   - IA (Identification and Authentication)
   - IR (Incident Response)
   - MA (Maintenance)
   - MP (Media Protection)
   - PE (Physical and Environmental Protection)
   - PL (Planning)
   - PS (Personnel Security)
   - RA (Risk Assessment)
   - SA (System and Services Acquisition)
   - SC (System and Communications Protection)
   - SI (System and Information Integrity)

3. **Evaluate SSP Documentation Completeness**
   - Check for all required FedRAMP SSP Appendices (including FIPS 199, E-Authentication, Rules of Behavior, Incident Response Plan, Configuration Management Plan)
   - Verify control implementation descriptions meet FedRAMP narrative requirements
   - Assess whether security architecture diagrams show authorization boundary clearly
   - Review whether all interconnections and external services are documented

4. **Assess POA&M Items and Risk Levels**
   - Categorize open findings by risk level (High, Moderate, Low)
   - Evaluate remediation timelines against FedRAMP requirements (High: 30 days, Moderate: 90 days, Low: 120 days)
   - Identify any False Positives or Operational Requirements needing justification

5. **Recommend Authorization Path**
   - **Agency Authorization:** If service has specific agency sponsor and limited federal use case
   - **JAB Authorization:** If service will have broad federal agency adoption
   - Provide rationale for recommendation based on service characteristics
</instructions>

<output_format>
Provide the assessment in the following structure:

### Executive Summary
- Overall readiness score (1-100)
- Key strengths
- Critical gaps requiring attention
- Recommended authorization path with timeline estimate

### Control Family Gap Matrix

| Control Family | Total Controls | Implemented | Partial | Planned | Not Implemented | Risk Level |
|----------------|----------------|-------------|---------|---------|-----------------|------------|
| AC             | X              | X           | X       | X       | X               | High/Med/Low |
| ... (all 17 families) ...

### SSP Documentation Checklist

| SSP Component | Status | Notes |
|---------------|--------|-------|
| System Identification | ✓ / ⚠ / ✗ | ... |
| FIPS 199 Categorization | ✓ / ⚠ / ✗ | ... |
| Security Architecture Diagrams | ✓ / ⚠ / ✗ | ... |
| ... (all required components) ...

### POA&M Priorities

| Finding | Risk Level | Control | Remediation Timeline | FedRAMP Compliance |
|---------|------------|---------|----------------------|--------------------|
| ... | High/Moderate/Low | AC-2 | 30/90/120 days | On Track / At Risk |

### Authorization Readiness Score
- Controls: X/100
- Documentation: X/100
- Risk Management: X/100
- **Overall: X/100**

### Recommended Next Steps
1. [Prioritized action items]
2. ...
</output_format>

<examples>
Example control family assessment:

**AC (Access Control) - Moderate Baseline**
- Total Controls: 25
- Implemented: 18 (AC-1, AC-2, AC-3, AC-4, AC-6, AC-7, AC-8, AC-11, AC-12, AC-14, AC-17, AC-18, AC-19, AC-20, AC-21, AC-22, AC-23, AC-24)
- Partial: 5 (AC-2(1), AC-2(4), AC-3(7), AC-6(1), AC-17(1) - implemented but documentation incomplete)
- Planned: 2 (AC-2(12), AC-4(4) - roadmap Q2 2026)
- Not Implemented: 0
- Risk Level: **Moderate** - Partial implementations need completion within 90 days

**Gap Details:**
- AC-2(1) Account Management | Automated System Account Management: System logs account creation but automated provisioning workflows not documented in SSP
- AC-2(4) Account Management | Automated Audit Actions: Account audit logs generated but automated review alerts not configured
- AC-3(7) Access Enforcement | Role-based Access Control: RBAC implemented via IAM roles but role definitions and approval workflow not documented

**Remediation:**
1. Complete SSP narratives for partial implementations (30 days)
2. Configure automated account audit alerts (60 days)
3. Document RBAC role definitions and workflows (60 days)
</examples>
```

## Usage Instructions

1. **Gather Current Documentation:**
   - Existing System Security Plan (SSP) or security documentation
   - Current control implementation status
   - List of known security gaps or POA&M items
   - System architecture diagrams and data flow diagrams

2. **Fill in Variables:**
   - `{{SYSTEM_NAME}}`: Your cloud service name
   - `{{IMPACT_LEVEL}}`: Low, Moderate, or High (Moderate is most common)
   - `{{CURRENT_STATUS}}`: Your current FedRAMP status
   - `{{CURRENT_CONTROLS}}`: Summary of implemented controls
   - `{{SSP_STATUS}}`: Current SSP documentation state
   - `{{TARGET_AUTHORIZATION_DATE}}`: When you need to achieve authorization

3. **Provide Context:**
   Paste relevant portions of your current security documentation, control implementation evidence, or SSP into the conversation after the initial prompt.

4. **Review Assessment:**
   The AI will provide a structured readiness assessment with gap analysis and recommendations.

5. **Iterate on Gaps:**
   Ask follow-up questions about specific control families or findings that need clarification.

## Expected Output

### Sample Executive Summary

```
**Overall Readiness Score: 72/100**

**Key Strengths:**
- Strong Identity and Access Management (AC, IA families 90%+ complete)
- Comprehensive audit logging and monitoring (AU, SI families)
- Mature incident response and contingency planning (IR, CP families)
- Clear authorization boundary and architecture documentation

**Critical Gaps Requiring Attention:**
- Configuration Management (CM family): Automated baseline configuration scanning not implemented (CM-6, CM-7)
- System and Communications Protection (SC family): Encryption at rest not enforced for all data stores (SC-28)
- Physical and Environmental Protection (PE family): Colocation data center MOU lacks FedRAMP-required clauses (PE-1, PE-3)

**Recommended Authorization Path: Agency Authorization**
- Rationale: Service has primary use case with Department of Education; Agency path faster (9-12 months vs 15-18 for JAB)
- Estimated timeline: 10 months to Authority to Operate (ATO) with current gaps addressed

**Critical Path:**
1. Address High-risk POA&M items (30 days)
2. Complete CM and SC family implementations (90 days)
3. Finalize SSP and security documentation (120 days)
4. 3PAO assessment and remediation (150-210 days)
5. Agency authorization decision (270-300 days)
```

### Sample Gap Matrix

| Control Family | Total | Implemented | Partial | Planned | Not Impl | Risk   |
|----------------|-------|-------------|---------|---------|----------|--------|
| AC             | 25    | 18          | 5       | 2       | 0        | Medium |
| CM             | 12    | 7           | 2       | 1       | 2        | High   |
| SC             | 18    | 12          | 3       | 2       | 1        | High   |
| PE             | 8     | 5           | 2       | 0       | 1        | Medium |

## Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `{{SYSTEM_NAME}}` | Cloud service or system name | "CloudDocs Enterprise Platform" |
| `{{IMPACT_LEVEL}}` | Target FedRAMP baseline | "Moderate" |
| `{{CURRENT_STATUS}}` | Current FedRAMP status | "None" or "FedRAMP Ready" |
| `{{CURRENT_CONTROLS}}` | Summary of implemented controls | "We have implemented AC, AU, IA families; partial CM, SC" |
| `{{SSP_STATUS}}` | SSP documentation state | "Draft SSP exists but incomplete appendices" |
| `{{TARGET_AUTHORIZATION_DATE}}` | Target ATO date | "December 2026" |

## Tips for Better Results

- **Moderate Baseline is Most Common:** Unless you have specific Low or High requirements, assume Moderate baseline (325+ controls). Most federal cloud services use Moderate.

- **JAB Path is Longer but More Portable:** JAB authorization takes 12-18+ months but is recognized by all agencies. Agency authorization is faster (6-12 months) but tied to sponsoring agency.

- **Focus on High-Risk Control Families First:** FedRAMP 3PAO assessments focus heavily on AC (Access Control), IA (Identification and Authentication), SC (System and Communications Protection), and AU (Audit and Accountability). Prioritize these.

- **Documentation Quality Matters:** FedRAMP SSP narratives must be detailed. Generic or vague control descriptions will result in findings. Provide specific implementation details, evidence, and responsible roles.

- **Continuous Monitoring is Required:** FedRAMP authorization is not one-time. Plan for ongoing ConMon (Continuous Monitoring) with monthly POA&M updates, annual assessments, and significant change requests.

- **Leverage FedRAMP Templates:** Use official FedRAMP SSP templates and appendices from FedRAMP.gov. Don't create custom formats.

- **Engage a 3PAO Early:** Third Party Assessment Organizations (3PAOs) conduct the official FedRAMP assessment. Engaging one early for readiness assessment can identify gaps before formal assessment.

## Related Prompts

- **FISMA Control Evaluation** - If your system is federal but not cloud-based
- **NIST 800-53 Control Assessment** - For general NIST 800-53 compliance beyond FedRAMP

## Version History

- **1.0** (2026-01-27): Initial FedRAMP compliance assessment prompt

## Sources

- [FedRAMP Program](https://www.fedramp.gov/)
- [NIST SP 800-53 Rev 5](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final)
- [FedRAMP Security Controls Baseline](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Security_Controls_Baseline.xlsx)
