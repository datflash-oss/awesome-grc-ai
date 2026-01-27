---
title: "PCI DSS Gap Analysis"
framework: "PCI DSS"
category: "Gap Analysis"
version: "1.0"
framework_version: "PCI DSS v4.0"
last_updated: "2026-01-27"
author: "Community"
complexity: "Intermediate"
estimated_time: "15-20 minutes"
tested_with: "Claude 3.5 Sonnet+"
---

## Description

Conducts a comprehensive gap analysis of your environment against all 12 PCI DSS v4.0 requirements. Identifies gaps between current implementation and required controls, assesses risk level for each gap (Critical/High/Medium/Low), and recommends remediation actions with estimated timelines.

**When to use this prompt:**
- Initial PCI DSS compliance assessment
- Annual compliance reviews
- Post-incident gap analysis after security event
- Pre-audit preparation to identify high-risk gaps
- When scoping changes affect cardholder data environment

**What this prompt does:**
- Reviews your environment against all 12 PCI DSS v4.0 requirements (361 individual sub-requirements)
- Identifies specific gaps in control implementation
- Assesses risk level based on data exposure and attack likelihood
- Prioritizes remediation based on risk and compliance impact
- Provides actionable remediation recommendations with timelines
- Flags requirements requiring targeted risk analysis (TRA) per v4.0

## Framework Context

PCI DSS (Payment Card Industry Data Security Standard) v4.0 is the current version (effective March 31, 2024) for organizations handling payment card data. It includes 12 requirements across 6 objectives, with 361 sub-requirements defining specific controls.

**Key v4.0 changes affecting gap analysis:**
- **Customized Approach**: New option to meet requirements through alternative controls (alongside Defined Approach)
- **Continuous Compliance**: Shift from point-in-time to ongoing validation
- **Expanded MFA**: Now required for all access to cardholder data environment (not just administrative)
- **Targeted Risk Analysis**: Required for specific sub-requirements to justify implementation decisions
- **Phishing-Resistant MFA**: Required by March 31, 2027 (future-dated requirement)

**Gap analysis identifies:**
1. Missing controls (not implemented)
2. Partial implementations (implemented but insufficient)
3. Configuration gaps (implemented incorrectly)
4. Documentation gaps (control exists but not documented/evidenced)
5. Process gaps (control exists but not consistently followed)

## Prompt

Copy and paste this prompt into Claude, after replacing the variables:

```
You are a PCI DSS compliance analyst conducting a gap analysis against PCI DSS v4.0 requirements.

<environment>
Organization name: {{ORGANIZATION_NAME}}
Transaction volume: {{TRANSACTION_VOLUME}}
Compliance level: {{COMPLIANCE_LEVEL}}
Cardholder data environment: {{CDE_DESCRIPTION}}
Card data flow: {{CARD_DATA_FLOW}}
Current security controls: {{CURRENT_CONTROLS}}
Network architecture: {{NETWORK_ARCHITECTURE}}
Validation approach: {{VALIDATION_APPROACH}}
Target compliance date: {{TARGET_COMPLIANCE_DATE}}
</environment>

<instructions>
Conduct a structured gap analysis of this environment against all 12 PCI DSS v4.0 requirements.

**For each of the 12 requirements:**

1. **Review the requirement** and its sub-requirements
2. **Assess current state** based on environment description
3. **Identify gaps** where implementation is:
   - Missing (control not implemented)
   - Partial (implemented but incomplete)
   - Misconfigured (implemented incorrectly)
   - Undocumented (control exists but lacks evidence)
   - Inconsistent (not consistently applied)
4. **Evaluate risk level** for each gap:
   - **Critical**: Immediate data breach risk, audit blocker, regulatory penalty exposure
   - **High**: Significant security risk, likely audit finding, requires urgent attention
   - **Medium**: Moderate risk, potential audit finding, should address soon
   - **Low**: Minor gap, unlikely to cause audit failure, can defer
5. **Recommend remediation**:
   - Specific action to close gap
   - Implementation approach (technology, process, or documentation)
   - Estimated timeline (days/weeks/months)
   - Responsible party (typical role)
   - Dependencies or prerequisites

**Requirements to analyze:**

1. Install and maintain network security controls
2. Apply secure configurations to all system components
3. Protect stored account data
4. Protect cardholder data with strong cryptography during transmission
5. Protect all systems and networks from malicious software
6. Develop and maintain secure systems and software
7. Restrict access to system components and cardholder data by business need to know
8. Identify users and authenticate access to system components
9. Restrict physical access to cardholder data
10. Log and monitor all access to system components and cardholder data
11. Test security of systems and networks regularly
12. Support information security with organizational policies and programs

**Special considerations:**
- Flag requirements that need Targeted Risk Analysis (TRA) per v4.0
- Identify future-dated requirements (e.g., phishing-resistant MFA by 2027)
- Note if Customized Approach might be suitable for specific gaps
- Consider compensating controls where Defined Approach is infeasible
</instructions>

<output_format>
Return gap analysis in this structure:

# PCI DSS v4.0 Gap Analysis
**Organization:** {{ORGANIZATION_NAME}}
**Compliance Level:** {{COMPLIANCE_LEVEL}}
**Analysis Date:** [Today's date]
**Target Compliance:** {{TARGET_COMPLIANCE_DATE}}

---

## Executive Summary

**Overall Compliance Status:** [X% compliant / Y total gaps identified]

**Critical Gaps (Immediate Attention Required):** [Count]
**High Priority Gaps:** [Count]
**Medium Priority Gaps:** [Count]
**Low Priority Gaps:** [Count]

**Top 3 Risks:**
1. [Most critical gap and impact]
2. [Second most critical gap and impact]
3. [Third most critical gap and impact]

**Estimated Remediation Timeline:** [X weeks/months to full compliance]

---

## Requirement 1: Install and Maintain Network Security Controls

### 1.1 Current State
[Brief assessment of current implementation]

### 1.2 Identified Gaps

#### Gap 1.1: [Gap Title]
- **Sub-requirement:** [Specific PCI DSS requirement number and text]
- **Current State:** [What's implemented]
- **Gap Description:** [What's missing or insufficient]
- **Risk Level:** [Critical/High/Medium/Low]
- **Risk Rationale:** [Why this risk level - data exposure, attack vector, compliance impact]
- **Remediation:**
  - **Action:** [Specific steps to close gap]
  - **Approach:** [Technology/Process/Documentation change needed]
  - **Timeline:** [Days/weeks/months]
  - **Owner:** [Typical responsible role]
  - **Dependencies:** [Prerequisite actions or resources]
- **TRA Required:** [Yes/No - if Targeted Risk Analysis is needed]

#### Gap 1.2: [Gap Title]
[Same structure]

[Continue for all gaps in Requirement 1]

---

## Requirement 2: Apply Secure Configurations
[Same structure as Requirement 1]

---

[Continue through all 12 requirements]

---

## Gap Summary Table

| Req | Gap Title | Risk | Timeline | Owner | Status |
|-----|-----------|------|----------|-------|--------|
| 1.1 | [Gap title] | 🔴 Critical | 2 weeks | Network Team | Not Started |
| 3.2 | [Gap title] | 🔴 Critical | 1 month | Security Team | Not Started |
| 8.1 | [Gap title] | 🟡 High | 3 weeks | IAM Team | Not Started |
| ... | ... | ... | ... | ... | ... |

**Legend:**
- 🔴 Critical
- 🟡 High
- 🟠 Medium
- ⚪ Low

---

## Remediation Roadmap

### Phase 1: Critical Gaps (Weeks 1-4)
1. [Gap with highest risk]
2. [Second critical gap]
3. [Third critical gap]

**Milestone:** Critical audit blockers resolved

### Phase 2: High Priority Gaps (Weeks 5-12)
[List of high priority gaps]

**Milestone:** Major security risks mitigated

### Phase 3: Medium Priority Gaps (Months 4-6)
[List of medium priority gaps]

**Milestone:** Full compliance achieved

### Phase 4: Low Priority Gaps & Optimization (Months 7+)
[List of low priority items and continuous improvement]

**Milestone:** Mature compliance program

---

## Targeted Risk Analysis Requirements

The following gaps require Targeted Risk Analysis (TRA) per PCI DSS v4.0:
1. [Requirement X.Y.Z] - [Reason TRA needed]
2. [Requirement A.B.C] - [Reason TRA needed]

---

## Recommended Next Steps

1. **Immediate (This Week):**
   - [Action 1]
   - [Action 2]

2. **Short-term (This Month):**
   - [Action 3]
   - [Action 4]

3. **Medium-term (This Quarter):**
   - [Action 5]
   - [Action 6]

4. **Schedule:**
   - Engage QSA/ISA (if Level 1/2): [Date]
   - Complete critical gaps: [Date]
   - Interim assessment: [Date]
   - Target compliance date: [Date]

---

## Compensating Controls Opportunities

For gaps where Defined Approach is infeasible, consider these compensating controls:
1. [Gap] → [Potential compensating control]
2. [Gap] → [Potential compensating control]

**Note:** Compensating controls must meet rigorous criteria and require formal documentation.

---

## Additional Recommendations

[Any environment-specific recommendations, architecture improvements, or strategic guidance]
</output_format>

<examples>
<example>
<input>
Organization name: Acme E-Commerce Inc.
Transaction volume: 2.5 million annually
Compliance level: Level 2
Cardholder data environment: E-commerce website using hosted payment page (iFrame), backend order processing system
Card data flow: Customer enters card on hosted payment page (provider-controlled), token returned to our application, full PAN stored encrypted in database for recurring billing
Current security controls: Firewalls in place, antivirus on servers, passwords required, logs collected but not reviewed regularly, no formal security policy
Network architecture: Single flat network, web servers and database on same segment, no DMZ
Validation approach: Self-Assessment Questionnaire (SAQ D-Merchant)
Target compliance date: June 2026
</input>
<output>
# PCI DSS v4.0 Gap Analysis
**Organization:** Acme E-Commerce Inc.
**Compliance Level:** Level 2 (SAQ D-Merchant)
**Analysis Date:** January 27, 2026
**Target Compliance:** June 2026

---

## Executive Summary

**Overall Compliance Status:** ~35% compliant / 47 total gaps identified

**Critical Gaps (Immediate Attention Required):** 8
**High Priority Gaps:** 15
**Medium Priority Gaps:** 18
**Low Priority Gaps:** 6

**Top 3 Risks:**
1. **Full PAN storage without business justification (Req 3.3)** - Storing full PAN for recurring billing significantly expands scope and risk. Token-based billing would eliminate this Critical gap.
2. **No network segmentation (Req 1.3)** - Flat network means entire infrastructure is in-scope. Compromise of web server provides direct database access.
3. **No centralized log monitoring (Req 10.7)** - Logs collected but not reviewed. Unable to detect breaches or unauthorized access in real-time.

**Estimated Remediation Timeline:** 20-24 weeks to full compliance (5-6 months)

---

## Requirement 1: Install and Maintain Network Security Controls

### 1.1 Current State
Firewalls present at network perimeter but lack proper configuration management, rules documentation, and review processes. No internal segmentation between web, application, and database tiers. No DMZ for internet-facing systems.

### 1.2 Identified Gaps

#### Gap 1.1: Lack of Network Segmentation
- **Sub-requirement:** 1.2.1 - Configuration standards for NSCs are defined and implemented
- **Current State:** Single flat network with all CDE components on same segment
- **Gap Description:** No network segmentation isolating CDE from other systems. Web servers, application servers, and database servers on same broadcast domain. No DMZ for public-facing systems.
- **Risk Level:** 🔴 Critical
- **Risk Rationale:** Flat network means compromise of any system (e.g., vulnerable web server) provides direct access to cardholder data in database. Entire infrastructure in-scope for PCI DSS, increasing audit complexity and cost. Single point of failure for security controls.
- **Remediation:**
  - **Action:** Implement network segmentation with at least 3 zones: (1) DMZ for web tier, (2) Internal zone for application tier, (3) Restricted zone for database tier. Deploy VLANs and firewall rules between zones. Only allow required ports/protocols between zones.
  - **Approach:** Technology - Network architecture redesign with firewall rules and VLANs
  - **Timeline:** 4-6 weeks (includes design, implementation, testing, cutover)
  - **Owner:** Network Engineering Team
  - **Dependencies:** Network diagram and data flow documentation; firewall hardware/software capable of VLAN segmentation
- **TRA Required:** No

#### Gap 1.2: Firewall Rule Documentation and Review
- **Sub-requirement:** 1.2.2 - Configuration standards for NSCs are kept current and applied to NSCs
- **Current State:** Firewalls exist but rules not formally documented, no review process
- **Gap Description:** No documentation of business justification for each firewall rule. No periodic review of rules (required every 6 months). Unknown if rules follow least-privilege principle.
- **Risk Level:** 🟡 High
- **Risk Rationale:** Undocumented rules likely include unnecessary open ports or overly permissive access. Over time, rules accumulate without removal when no longer needed, increasing attack surface. Audit finding likely.
- **Remediation:**
  - **Action:** Document all current firewall rules with business justification. Establish semi-annual review process. Remove unnecessary rules. Implement change management for future rule changes.
  - **Approach:** Process - Documentation and periodic review workflow
  - **Timeline:** 2 weeks (1 week documentation, 1 week cleanup and process)
  - **Owner:** Network Security Team
  - **Dependencies:** Complete network diagram; identification of all required ports/protocols
- **TRA Required:** No

#### Gap 1.3: No IDS/IPS at Critical Locations
- **Sub-requirement:** 1.4.1 - Network intrusion detection and/or intrusion prevention systems are used
- **Current State:** No IDS/IPS deployed
- **Gap Description:** No intrusion detection or prevention at network perimeter or between network segments (when segmentation is implemented). Unable to detect malicious traffic patterns or active attacks.
- **Risk Level:** 🟡 High
- **Risk Rationale:** No automated alerting for reconnaissance, exploit attempts, or data exfiltration. Breaches may go undetected for weeks or months (industry average: 191 days). Compensates for firewall misconfigurations.
- **Remediation:**
  - **Action:** Deploy IDS/IPS at perimeter and between network zones (after segmentation). Configure signature-based and anomaly-based detection. Integrate with SIEM or log management platform. Establish alert response procedures.
  - **Approach:** Technology - IDS/IPS deployment with monitoring
  - **Timeline:** 3-4 weeks (after segmentation complete)
  - **Owner:** Security Operations Team
  - **Dependencies:** Network segmentation (Gap 1.1); SIEM or log management platform (Gap 10.1)
- **TRA Required:** No

[Additional gaps 1.4, 1.5, etc. would continue...]

---

## Requirement 3: Protect Stored Account Data

### 3.1 Current State
Full Primary Account Number (PAN) stored encrypted in database for recurring billing functionality. Encryption keys stored on same server as encrypted data. No formal data retention policy or secure deletion process.

### 3.2 Identified Gaps

#### Gap 3.1: Full PAN Storage Without Minimization
- **Sub-requirement:** 3.3.1 - PAN is not retained after authorization unless there is a legitimate business or legal need
- **Current State:** Full PAN stored encrypted for recurring billing
- **Gap Description:** Storing full PAN significantly expands PCI DSS scope and risk. Alternative approaches exist (tokenization, payment service provider vaulting) that eliminate need to store PAN while supporting recurring billing.
- **Risk Level:** 🔴 Critical
- **Risk Rationale:** Storing PAN makes entire database and surrounding infrastructure in-scope for PCI DSS. Data breach would expose actual card numbers (if keys compromised), not just tokens. Regulatory penalties and card brand fines for breach are severe. This is the highest-impact decision affecting compliance cost and risk.
- **Remediation:**
  - **Action:** Migrate to token-based recurring billing. Work with payment gateway/processor to vault cards and return tokens. Replace PAN fields with tokens in database. Update billing logic to submit tokens (not PAN) for recurring charges. Securely delete existing PANs after migration.
  - **Approach:** Technology - Payment architecture redesign using tokenization
  - **Timeline:** 8-12 weeks (includes provider integration, code changes, testing, data migration, and PAN purge)
  - **Owner:** Engineering Team (with payment provider coordination)
  - **Dependencies:** Payment provider supports tokenization and recurring billing; business approval to change payment flow
- **TRA Required:** No (but business justification for current PAN storage must be documented if continuing)

**RECOMMENDATION:** This is the single most impactful change to reduce PCI scope, cost, and risk. Prioritize this gap above almost all others. Tokenization can reduce in-scope systems by 70-90%.

#### Gap 3.2: Encryption Key Management Issues
- **Sub-requirement:** 3.6.1 - Cryptographic keys are generated using cryptographically strong methods
- **Current State:** Encryption keys stored on same server as encrypted data
- **Gap Description:** Keys stored on same system as the data they protect. No key separation, key rotation process, or key management system. Key generation method unknown. Likely using application-generated keys rather than HSM or key management service.
- **Risk Level:** 🔴 Critical
- **Risk Rationale:** If database server compromised, attacker gains both encrypted data AND encryption keys, allowing full data decryption. Keys stored in configuration files or code are easily extracted. This completely negates encryption protection.
- **Remediation:**
  - **Action:** Implement key management system with key separation. Move keys off database server to separate key management server or use cloud KMS. Implement key rotation (annually at minimum). Use HSM or KMS for key generation. Restrict key access to minimum necessary personnel/processes.
  - **Approach:** Technology - Key management system deployment
  - **Timeline:** 4-6 weeks (overlaps with PAN elimination project)
  - **Owner:** Security Engineering Team
  - **Dependencies:** If continuing to store PAN (not recommended), this is mandatory; if moving to tokenization (recommended), less critical but still needed for other sensitive data
- **TRA Required:** No

**NOTE:** If Gap 3.1 is remediated (moving to tokenization), this gap's urgency reduces significantly as no PAN would remain to protect.

[Additional gaps 3.3, 3.4, etc. would continue...]

---

[Requirements 4-12 would continue with same structure...]

---

## Gap Summary Table

| Req | Gap Title | Risk | Timeline | Owner | Status |
|-----|-----------|------|----------|-------|--------|
| 3.1 | Full PAN Storage Without Minimization | 🔴 Critical | 8-12 weeks | Engineering | Not Started |
| 3.2 | Encryption Key Management Issues | 🔴 Critical | 4-6 weeks | Security Eng | Not Started |
| 1.1 | Lack of Network Segmentation | 🔴 Critical | 4-6 weeks | Network Eng | Not Started |
| 10.1 | No Centralized Log Management | 🔴 Critical | 3-4 weeks | SecOps | Not Started |
| 8.1 | No MFA for CDE Access | 🔴 Critical | 2-3 weeks | IAM Team | Not Started |
| 11.1 | No Vulnerability Scanning Process | 🔴 Critical | 1-2 weeks | Security | Not Started |
| 12.1 | No Formal Security Policy | 🔴 Critical | 2-3 weeks | CISO/GRC | Not Started |
| 6.1 | No Secure Development Lifecycle | 🔴 Critical | 8-12 weeks | Engineering | Not Started |
| 1.2 | Firewall Rule Documentation & Review | 🟡 High | 2 weeks | Network Sec | Not Started |
| 1.3 | No IDS/IPS Deployment | 🟡 High | 3-4 weeks | SecOps | Not Started |
| ... | ... | ... | ... | ... | ... |

---

## Remediation Roadmap

### Phase 1: Critical Gaps (Weeks 1-12)
**Priority: Eliminate audit blockers and immediate breach risks**

**Weeks 1-4:**
1. **Formal Security Policy** (Gap 12.1) - 2-3 weeks - Foundational for all other requirements
2. **MFA for CDE Access** (Gap 8.1) - 2-3 weeks - Quick win with high impact
3. **Vulnerability Scanning** (Gap 11.1) - 1-2 weeks - Identify unknown vulnerabilities immediately
4. **Start Network Segmentation Design** (Gap 1.1) - Design phase only

**Weeks 5-8:**
5. **Centralized Log Management** (Gap 10.1) - 3-4 weeks - Enable monitoring and forensics
6. **Complete Network Segmentation** (Gap 1.1) - Implementation and testing
7. **Firewall Rule Documentation** (Gap 1.2) - Quick process fix

**Weeks 9-12:**
8. **Begin PAN Tokenization Project** (Gap 3.1) - 8-12 weeks total, start now
9. **Key Management System** (Gap 3.2) - 4-6 weeks, parallel to tokenization
10. **Secure SDLC Program** (Gap 6.1) - 8-12 weeks, start now for long-term benefit

**Milestone:** Critical audit blockers resolved by end of Week 12

### Phase 2: High Priority Gaps (Weeks 13-24)
[15 high-priority gaps to address]

**Milestone:** Major security risks mitigated, SAQ D-Merchant achievable by end of Week 24

### Phase 3: Medium Priority Gaps (Months 7-9)
[18 medium-priority gaps]

**Milestone:** Full compliance with all PCI DSS v4.0 Defined Approach requirements

### Phase 4: Low Priority Gaps & Continuous Improvement (Month 10+)
[6 low-priority optimizations]

**Milestone:** Mature compliance program with continuous monitoring

---

## Targeted Risk Analysis Requirements

The following gaps may benefit from Targeted Risk Analysis (TRA) approach:
1. **Requirement 8.3.6** (Change passwords every 90 days) - If implementing technical controls like password complexity + MFA + account lockout, TRA may justify longer rotation period
2. **Requirement 12.3.1** (Acceptable use policy) - TRA can define scope and applicability based on actual user roles

**Note:** TRA is optional in v4.0 but requires formal risk analysis documentation.

---

## Recommended Next Steps

1. **Immediate (This Week):**
   - **Decision on PAN storage:** Commit to tokenization migration or document business justification for continued storage
   - **Engage QSA/ISA:** If Level 1/2, engage auditor now to validate remediation approach
   - **Assign gap owners:** Map each gap to responsible team/individual
   - **Establish weekly status reviews:** Track remediation progress

2. **Short-term (This Month):**
   - **Draft security policy:** Start with PCI DSS-required sections (asset management, access control, incident response)
   - **Deploy MFA:** Quick win that addresses Critical gap 8.1
   - **Start vulnerability scanning:** Contract with Approved Scanning Vendor (ASV) for external scans
   - **Network segmentation design:** Finalize architecture with documented data flows

3. **Medium-term (This Quarter):**
   - **Complete tokenization migration:** Eliminate PAN storage and drastically reduce scope
   - **Implement segmentation:** Isolate CDE from rest of infrastructure
   - **Deploy log management:** Centralize logs and implement alerting
   - **Interim assessment:** Self-assess compliance at 90 days to track progress

4. **Schedule:**
   - **Engage QSA/ISA:** February 2026 (Level 2 requires annual SAQ, consider QSA guidance)
   - **Complete Critical gaps:** April 2026 (12 weeks from now)
   - **Interim assessment:** April 2026 (mid-point check)
   - **Target compliance date:** June 2026 (5 months, realistic for 47 gaps)
   - **Annual assessment:** June 2027 and annually thereafter

---

## Compensating Controls Opportunities

For gaps where Defined Approach is infeasible, consider these compensating controls:

1. **Gap 9.x (Physical Security)** → If fully cloud-hosted with no physical infrastructure:
   - **Compensating Control:** Inherit physical security controls from cloud provider's PCI DSS compliance (AWS, Azure, GCP are PCI DSS certified). Document responsibility matrix.
   - **Requirements:** Cloud provider AOC (Attestation of Compliance), responsibility matrix defining provider vs. customer controls

2. **Gap 11.3.2 (External vulnerability scans)** → If no public-facing IPs:
   - **Compensating Control:** If using fully hosted payment page and all card data handling is provider-side, external scanning may not apply. Document scoping rationale.
   - **Requirements:** Network diagram showing no in-scope systems with public IPs, payment flow documentation

**Note:** Compensating controls must be reviewed and approved by QSA. They require formal documentation demonstrating equivalent or greater security.

---

## Additional Recommendations

### Strategic Recommendation: Minimize PCI Scope
The current environment (full PAN storage, flat network) maximizes PCI DSS scope and cost. Strategic architecture changes can reduce scope by 80-90%:

1. **Tokenization** (Gap 3.1): Eliminate PAN storage → removes database, application servers, backup systems from scope
2. **Hosted Payment Page** (already in place): Keep using provider iFrame → keeps web application largely out of scope
3. **Network Segmentation** (Gap 1.1): Isolate remaining in-scope systems → reduces infrastructure affected by PCI requirements

**Impact:** Could reduce from 47 gaps across entire infrastructure to ~15-20 gaps on isolated payment processing systems. Annual compliance cost reduction: 50-70%.

### Consider Automation Platform
With 47 gaps and Level 2 validation (annual SAQ), consider PCI DSS compliance automation platforms:
- **SecurityMetrics**, **Trustwave**, **ControlCase**: Continuous scanning, evidence collection, SAQ assistance
- **ROI:** ~$10K-$30K annually but saves 100-200 hours of manual compliance work

### Prioritize Tokenization Decision
The decision to continue storing PAN vs. migrate to tokenization affects almost every other remediation decision. Make this decision in the next 2 weeks:
- **Continue storing PAN:** Requires full Key Management System (Gap 3.2), annual key rotation, penetration testing, etc. Keeps ~40 systems in scope.
- **Migrate to tokenization:** Reduces scope dramatically, eliminates most Requirement 3 gaps, makes compliance 70% easier.

**Recommendation:** Migrate to tokenization unless there is a compelling business reason (e.g., offline payment processing, specific billing requirements unsupported by provider).

</output>
</example>
</examples>
```

## Usage Instructions

### Step 1: Gather Environment Information

Before using the prompt, document your cardholder data environment:

**Basic information:**
- Organization name and transaction volume (determines compliance level)
- Cardholder data environment description (systems that store, process, or transmit card data)
- Card data flow (how payment data moves through your systems)

**Technical details:**
- Network architecture (segmentation, DMZ, VLANs, cloud vs. on-premise)
- Current security controls (firewalls, encryption, access controls, logging, antivirus, etc.)
- Validation approach (SAQ type: A, A-EP, B, B-IP, C, D-Merchant, D-Service Provider, or QSA audit)

**Timeline:**
- Target compliance date

**Tip:** Create a network diagram and data flow diagram before running this prompt. Visual documentation helps you accurately describe your environment and will be required for audit.

### Step 2: Replace Variables

Copy the prompt above and replace all `{{VARIABLES}}`:

- `{{ORGANIZATION_NAME}}`: Your company legal name
- `{{TRANSACTION_VOLUME}}`: Annual transaction count (determines compliance level)
- `{{COMPLIANCE_LEVEL}}`: Level 1, 2, 3, or 4 (see PCI DSS README for thresholds)
- `{{CDE_DESCRIPTION}}`: Brief description of systems in cardholder data environment
- `{{CARD_DATA_FLOW}}`: How payment data enters, moves through, and exits your systems
- `{{CURRENT_CONTROLS}}`: What security controls you currently have (be comprehensive)
- `{{NETWORK_ARCHITECTURE}}`: Network design (segmentation, zones, cloud vs. on-prem)
- `{{VALIDATION_APPROACH}}`: SAQ type or "QSA Audit" if Level 1
- `{{TARGET_COMPLIANCE_DATE}}`: When you need to be compliant

### Step 3: Paste into Claude

Paste your customized prompt into Claude. Wait 20-30 seconds for comprehensive analysis. For complex environments, Claude may take up to 60 seconds.

### Step 4: Review and Validate

Claude will generate a detailed gap analysis. Review and adjust:

- **Validate risk assessments**: Adjust risk levels based on your specific context and risk tolerance
- **Verify sub-requirements**: Cross-reference gap findings against official PCI DSS v4.0 documentation
- **Customize remediation timelines**: Adjust based on your resources, budget, and priorities
- **Add environment-specific gaps**: Include any unique risks Claude may have missed
- **Consult with QSA**: Share the gap analysis with your Qualified Security Assessor (if Level 1/2) or payment processor for validation

### Step 5: Build Remediation Plan

Export the gap analysis and remediation roadmap to your project management system. Assign owners, set deadlines, and track progress. Schedule weekly or bi-weekly reviews to ensure timeline adherence.

## Expected Output

A comprehensive 20-40 page gap analysis document with:

- **Executive summary** with compliance percentage, gap counts by risk level, top risks
- **Detailed gap analysis** for all 12 PCI DSS requirements (30-60 individual gaps typical)
- **Risk assessment** for each gap (Critical/High/Medium/Low with rationale)
- **Remediation recommendations** with specific actions, timelines, owners, dependencies
- **Gap summary table** for quick reference and tracking
- **Remediation roadmap** phased by priority (Critical → High → Medium → Low)
- **Targeted Risk Analysis (TRA) flagging** for requirements requiring formal risk analysis
- **Compensating controls** suggestions where Defined Approach is infeasible
- **Strategic recommendations** for scope reduction and architecture optimization

**Example gap entry:**

```markdown
#### Gap 3.1: Full PAN Storage Without Minimization
- **Sub-requirement:** 3.3.1 - PAN is not retained after authorization unless legitimate business need
- **Current State:** Full PAN stored encrypted for recurring billing
- **Gap Description:** Storing full PAN expands scope and risk. Tokenization alternatives exist.
- **Risk Level:** 🔴 Critical
- **Risk Rationale:** Storing PAN makes entire database in-scope for PCI DSS. Breach exposes actual card numbers. Highest impact on compliance cost and risk.
- **Remediation:**
  - **Action:** Migrate to token-based recurring billing with payment provider vaulting
  - **Approach:** Technology - Payment architecture redesign using tokenization
  - **Timeline:** 8-12 weeks
  - **Owner:** Engineering Team
  - **Dependencies:** Payment provider tokenization support, business approval
- **TRA Required:** No
```

## Variables

| Variable | Description | Required | Example |
|----------|-------------|----------|---------|
| `{{ORGANIZATION_NAME}}` | Organization legal name | Yes | "Acme E-Commerce Inc." |
| `{{TRANSACTION_VOLUME}}` | Annual transaction count | Yes | "2.5 million transactions annually" |
| `{{COMPLIANCE_LEVEL}}` | PCI DSS validation level (1-4) | Yes | "Level 2" |
| `{{CDE_DESCRIPTION}}` | Systems in cardholder data environment | Yes | "E-commerce website (hosted payment page), order processing system, customer database" |
| `{{CARD_DATA_FLOW}}` | How card data moves through systems | Yes | "Customer enters card on provider-hosted payment page, token returned to our app, token stored for recurring billing" |
| `{{CURRENT_CONTROLS}}` | Existing security controls | Yes | "Perimeter firewalls, SSL/TLS, encrypted database, antivirus on servers, password authentication (no MFA), logs collected but not monitored" |
| `{{NETWORK_ARCHITECTURE}}` | Network design and segmentation | Yes | "Single flat network, web and database on same segment, AWS-hosted (us-east-1), no DMZ" |
| `{{VALIDATION_APPROACH}}` | SAQ type or QSA audit | Yes | "SAQ D-Merchant (self-assessment)" |
| `{{TARGET_COMPLIANCE_DATE}}` | Compliance deadline | Yes | "June 2026" |

**Tips for variable values:**
- **CARD_DATA_FLOW**: Be exhaustive. Include where data enters, how it's processed, where it's stored, how it's transmitted, when it's deleted.
- **CURRENT_CONTROLS**: List everything, even if partial. Better to overstate current state than understate and miss potential credit for existing controls.
- **NETWORK_ARCHITECTURE**: Include segmentation (or lack thereof), cloud vs. on-prem, zones/VLANs, internet-facing systems.

## Tips for Better Results

**Be honest about current state**: Underrepresenting gaps doesn't help - you'll discover them during audit anyway. Better to identify now when you can remediate proactively.

**Focus on scope reduction first**: The single most impactful decision is whether to store PAN. Tokenization, P2PE (point-to-point encryption), or hosted payment pages can reduce scope by 70-90%. Claude will identify these opportunities.

**Run this before engaging QSA**: Use the gap analysis to prepare for auditor engagement. Demonstrates proactive compliance effort and identifies issues before auditor finds them (which is more expensive to fix).

**Update quarterly**: Run gap analysis quarterly as you remediate. Track progress toward compliance and identify new gaps introduced by changes.

**Combine with vulnerability scanning**: This prompt identifies policy/process/architectural gaps. Supplement with technical vulnerability scanning (required by PCI DSS Requirement 11) to find configuration issues.

**Validate with PCI DSS v4.0 documentation**: Claude's analysis is based on v4.0 requirements but isn't a substitute for official documentation. Cross-reference critical gaps against the full standard.

**Consider compliance automation**: If gap analysis identifies 40+ gaps, consider platforms like SecurityMetrics, Trustwave, or ControlCase for continuous compliance monitoring.

## Related Prompts

- [PCI DSS Scoping Assessment](./scoping-assessment.md) *(Coming soon)* - Determine CDE boundaries and in-scope systems
- [PCI DSS SAQ Selector](./saq-selector.md) *(Coming soon)* - Determine which Self-Assessment Questionnaire applies

## Changelog

- **v1.0** (2026-01-27): Initial release based on PCI DSS v4.0 (effective March 2024)

## Sources

- [PCI DSS v4.0 Requirements and Testing Procedures](https://www.pcisecuritystandards.org/document_library/) - Official standard
- [PCI DSS v4.0 Summary of Changes](https://www.pcisecuritystandards.org/documents/PCI-DSS-v3_2_1-to-v4-0-Summary-of-Changes-r2.pdf) - Changes from v3.2.1
- [PCI DSS Prioritized Approach](https://www.pcisecuritystandards.org/document_library/) - Risk-based implementation guide
