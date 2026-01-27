---
title: "NIST AI RMF Risk Assessment"
framework: "NIST AI RMF"
category: "Risk Assessment"
version: "1.0"
framework_version: "AI RMF 1.0 (January 2023)"
last_updated: "2026-01-27"
author: "Community"
complexity: "Intermediate"
estimated_time: "15-20 minutes"
---

# NIST AI RMF Risk Assessment

## Description

This prompt provides a comprehensive AI risk assessment using the four core functions of the NIST Artificial Intelligence Risk Management Framework (AI RMF 1.0): GOVERN, MAP, MEASURE, and MANAGE. It helps identify AI-specific risks, assess their likelihood and impact, and develop appropriate mitigation strategies.

Use this prompt to:
- Conduct initial risk assessments for new AI systems
- Evaluate existing AI systems for trustworthiness
- Prepare for AI governance reviews or audits
- Document AI risk management for stakeholders
- Support responsible AI development practices

## Framework Context

The **NIST AI RMF 1.0** (released January 2023) is a voluntary, risk-based framework for managing risks associated with artificial intelligence systems. It complements existing enterprise risk management and cybersecurity frameworks.

### When to Use NIST AI RMF

Use this framework when:
- Developing or deploying AI/ML systems with potential impact on individuals or organizations
- Your organization needs a structured approach to AI risk management
- You need to demonstrate responsible AI practices to stakeholders, regulators, or customers
- You're implementing AI governance policies and need practical risk assessment methodology

The AI RMF is voluntary but increasingly referenced by regulators (e.g., EU AI Act, Executive Order on AI) and is becoming a de facto standard for AI risk management.

### Relationship to Other Frameworks

- **NIST Cybersecurity Framework (CSF):** AI RMF complements CSF; many organizations use both
- **ISO/IEC 42001 (AI Management System):** Compatible; AI RMF can support ISO 42001 implementation
- **EU AI Act:** AI RMF aligns with many EU AI Act requirements, especially for high-risk systems
- **NIST SP 800-53:** For federal systems, use AI RMF alongside traditional security controls

## Prompt

```
<ai_system>
System Name: {{SYSTEM_NAME}}
Purpose: {{SYSTEM_PURPOSE}}
Deployment Context: {{DEPLOYMENT_CONTEXT}}
Data Sources: {{DATA_SOURCES}}
Stakeholders: {{STAKEHOLDERS}}
</ai_system>

<instructions>
You are an AI risk management specialist conducting a comprehensive risk assessment using the NIST AI Risk Management Framework (AI RMF 1.0). Evaluate the AI system across all four core functions: GOVERN, MAP, MEASURE, and MANAGE.

## GOVERN: Governance and Culture

Assess governance structures and organizational culture for AI risk management:

1. **Accountability Structures:**
   - Who is accountable for AI system outcomes?
   - Are roles and responsibilities clearly defined?
   - Is there executive-level oversight of AI risks?

2. **Policies and Procedures:**
   - Do AI governance policies exist?
   - Are policies aligned with organizational values and legal requirements?
   - Is there a process for AI ethics review?

3. **Organizational Culture:**
   - Does the organization prioritize trustworthy AI?
   - Is there transparency in AI decision-making?
   - Are diverse perspectives included in AI development?

4. **Risk Management Integration:**
   - Is AI risk integrated into enterprise risk management?
   - Are resources allocated for AI risk management?

**Identify GOVERN risks:**
- Governance gaps (e.g., no clear accountability)
- Policy deficiencies (e.g., no AI ethics guidelines)
- Cultural issues (e.g., "move fast and break things" mentality for high-risk AI)

---

## MAP: Context and Risk Identification

Map the AI system context and identify specific risks:

1. **System Context:**
   - What is the system's purpose and intended use?
   - Who are the users and affected stakeholders?
   - What is the deployment environment?
   - What are reasonably foreseeable misuses?

2. **Data Analysis:**
   - What data is used for training and operation?
   - What is the data quality and provenance?
   - Are there data gaps, biases, or quality issues?
   - Is data representative of the deployment population?

3. **Impact Assessment:**
   - What are potential positive impacts?
   - What are potential negative impacts or harms?
   - Who might be disproportionately affected?
   - Are impacts reversible?

4. **Dependencies and Boundaries:**
   - What are system dependencies (third-party models, APIs, data sources)?
   - What is the system boundary?
   - What are interconnections with other systems?

**Identify MAP risks:**
- Harmful impacts (e.g., discriminatory outcomes, safety risks)
- Data quality issues (e.g., biased training data, insufficient representation)
- Context mismatches (e.g., system used outside intended context)
- Dependency risks (e.g., third-party model vulnerabilities)

---

## MEASURE: Metrics and Testing

Assess measurement of trustworthy AI characteristics:

1. **Accuracy and Reliability:**
   - What is model accuracy on test data?
   - Does performance generalize to real-world deployment?
   - Are there performance disparities across subgroups?

2. **Fairness and Bias:**
   - Have fairness metrics been calculated (e.g., demographic parity, equalized odds)?
   - Are there disparate impacts on protected groups?
   - Has bias testing been conducted?

3. **Robustness and Security:**
   - Has the model been tested for adversarial robustness?
   - Are there security vulnerabilities (e.g., prompt injection, data poisoning)?
   - How does the model handle edge cases or out-of-distribution data?

4. **Transparency and Explainability:**
   - Can the model's decisions be explained?
   - Is there documentation of model behavior?
   - Can users understand how decisions are made?

5. **Privacy:**
   - Are privacy-preserving techniques used (e.g., differential privacy, federated learning)?
   - Can the model leak sensitive training data?
   - Is PII handled appropriately?

6. **Monitoring:**
   - Is model performance monitored in production?
   - Are drift detection mechanisms in place?
   - Is there continuous measurement of trustworthy AI characteristics?

**Identify MEASURE risks:**
- Measurement gaps (e.g., fairness not quantified)
- Performance degradation (e.g., accuracy drops over time)
- Unexplainability (e.g., black-box model with no interpretability)
- Insufficient monitoring (e.g., no production performance tracking)

---

## MANAGE: Risk Treatment and Mitigation

Evaluate risk management and mitigation strategies:

1. **Risk Prioritization:**
   - What are the highest-severity risks?
   - What is the likelihood × impact of each risk?
   - Which risks require immediate attention?

2. **Risk Treatment:**
   For each identified risk, determine treatment:
   - **Mitigate:** Implement controls to reduce risk (most common)
   - **Accept:** Accept residual risk with justification
   - **Transfer:** Transfer risk (e.g., through insurance, contractual terms)
   - **Avoid:** Avoid risk by not deploying or changing approach

3. **Mitigation Controls:**
   - Technical controls (e.g., bias mitigation algorithms, adversarial training)
   - Procedural controls (e.g., human review of high-stakes decisions)
   - Monitoring controls (e.g., drift detection, anomaly detection)

4. **Incident Response:**
   - Is there a plan for AI incidents (e.g., discriminatory outcome, model failure)?
   - Are escalation procedures defined?
   - Is there a process for user feedback and complaints?

5. **Continuous Improvement:**
   - Is there a process for updating the model based on feedback?
   - Are lessons learned documented?
   - Is there a system retirement or decommissioning plan?

**Identify MANAGE risks:**
- Inadequate mitigation (e.g., high-severity risks without controls)
- No incident response plan
- Lack of continuous improvement process
- No decommissioning plan for end-of-life

---

## Overall Risk Assessment

After evaluating all four functions, provide:

1. **Risk Register:** List of all identified risks with likelihood (Low/Medium/High), impact (Low/Medium/High), and overall risk score

2. **Risk Heatmap:** Visual representation of risks by likelihood and impact

3. **Prioritized Recommendations:** Top 5-10 actions to improve AI trustworthiness

4. **Residual Risk Assessment:** After recommended mitigations, what risks remain?

</instructions>

<output_format>
Provide the assessment in the following structure:

# NIST AI RMF Risk Assessment: {{SYSTEM_NAME}}

## Executive Summary
- **System Purpose:** [One sentence]
- **Overall Risk Level:** High / Moderate / Low
- **Key Findings:** [3-5 bullet points]
- **Critical Recommendations:** [Top 3 actions]

---

## GOVERN: Governance and Culture

### Current State
[Description of governance structures, policies, culture]

### Identified Risks

| Risk ID | Risk Description | Likelihood | Impact | Risk Level | Mitigation |
|---------|------------------|------------|--------|------------|------------|
| GOV-1 | [Risk description] | High/Med/Low | High/Med/Low | High/Med/Low | [Proposed mitigation] |

### Recommendations
1. [Action item]
2. [Action item]

---

## MAP: Context and Risk Identification

### System Context
- **Intended Use:** [Description]
- **Key Stakeholders:** [List]
- **Deployment Environment:** [Description]
- **Potential Misuses:** [List]

### Data Analysis
- **Training Data:** [Description, size, sources]
- **Data Quality:** [Assessment]
- **Data Gaps/Biases:** [Identified issues]

### Impact Assessment
- **Positive Impacts:** [List]
- **Potential Harms:** [List]
- **Affected Populations:** [List]

### Identified Risks

| Risk ID | Risk Description | Likelihood | Impact | Risk Level | Mitigation |
|---------|------------------|------------|--------|------------|------------|
| MAP-1 | [Risk description] | High/Med/Low | High/Med/Low | High/Med/Low | [Proposed mitigation] |

### Recommendations
1. [Action item]
2. [Action item]

---

## MEASURE: Metrics and Testing

### Current Metrics
- **Accuracy:** [Metrics]
- **Fairness:** [Metrics]
- **Robustness:** [Metrics]
- **Explainability:** [Assessment]
- **Privacy:** [Assessment]
- **Monitoring:** [Current monitoring approach]

### Identified Risks

| Risk ID | Risk Description | Likelihood | Impact | Risk Level | Mitigation |
|---------|------------------|------------|--------|------------|------------|
| MEAS-1 | [Risk description] | High/Med/Low | High/Med/Low | High/Med/Low | [Proposed mitigation] |

### Recommendations
1. [Action item]
2. [Action item]

---

## MANAGE: Risk Treatment and Mitigation

### Risk Prioritization

**High-Priority Risks (Immediate Action Required):**
1. [Risk ID]: [Description]
2. [Risk ID]: [Description]

**Medium-Priority Risks (Address within 90 days):**
1. [Risk ID]: [Description]

**Low-Priority Risks (Monitor and address as resources allow):**
1. [Risk ID]: [Description]

### Mitigation Strategy

| Risk ID | Treatment | Controls | Owner | Timeline | Status |
|---------|-----------|----------|-------|----------|--------|
| [ID] | Mitigate/Accept/Transfer/Avoid | [Specific controls] | [Role] | [Date] | Planned/In Progress/Complete |

### Incident Response
[Description of current incident response plan or recommendation to create one]

### Continuous Improvement Plan
[Recommendations for ongoing monitoring and improvement]

---

## Risk Register Summary

| Risk ID | Function | Risk Description | Likelihood | Impact | Risk Score | Treatment | Status |
|---------|----------|------------------|------------|--------|------------|-----------|--------|
| GOV-1 | Govern | [Description] | H/M/L | H/M/L | H/M/L | Mitigate | Planned |
| MAP-1 | Map | [Description] | H/M/L | H/M/L | H/M/L | Mitigate | Planned |
| MEAS-1 | Measure | [Description] | H/M/L | H/M/L | H/M/L | Mitigate | Planned |
| MAN-1 | Manage | [Description] | H/M/L | H/M/L | H/M/L | Accept | Justified |

---

## Recommended Next Steps

**Immediate (0-30 days):**
1. [High-priority action]
2. [High-priority action]

**Short-term (30-90 days):**
1. [Medium-priority action]
2. [Medium-priority action]

**Long-term (90+ days):**
1. [Lower-priority action]
2. [Continuous improvement action]

---

## Residual Risk Assessment

After implementing recommended mitigations, the following residual risks remain:
- [Risk description and justification for acceptance]

**Overall Residual Risk Level:** High / Moderate / Low

</output_format>

<examples>
## Example: Customer Service Chatbot Risk Assessment

<ai_system>
System Name: CustomerAssist AI Chatbot
Purpose: Provide 24/7 customer support for e-commerce platform, handling order inquiries, returns, and general questions
Deployment Context: Public-facing web chat and mobile app, available to all customers (100K+ monthly users)
Data Sources: Historical customer service transcripts (5 years), product catalog, order database, FAQ documents
Stakeholders: Customers (end users), customer service team, product managers, compliance team
</ai_system>

### GOVERN Findings:

**Identified Risks:**
- **GOV-1:** No designated AI system owner with clear accountability for chatbot outcomes (Likelihood: High, Impact: Medium, Risk: **Medium**)
  - *Mitigation:* Assign Product Manager as AI System Owner with documented responsibilities
- **GOV-2:** No AI ethics review process for customer-facing AI (Likelihood: Medium, Impact: High, Risk: **High**)
  - *Mitigation:* Establish AI Ethics Review Board with representatives from legal, compliance, customer service, and product

**Recommendations:**
1. Create AI System Owner role with quarterly accountability reviews
2. Establish AI Ethics Review Board and review CustomerAssist AI
3. Develop AI incident response plan

### MAP Findings:

**System Context:**
- Intended Use: Answer customer questions, process returns, escalate to human agents when needed
- Potential Misuses: Customers trying to manipulate chatbot for unauthorized refunds; competitors probing for business intelligence

**Data Analysis:**
- Training Data: 500K customer service transcripts from 2019-2024
- Data Quality: High (verified human-agent conversations)
- Data Gaps: Limited representation of non-English speakers (95% English); may not handle multilingual queries well

**Identified Risks:**
- **MAP-1:** Training data skewed toward English-speaking customers; may provide poor service to non-English speakers (Likelihood: High, Impact: Medium, Risk: **Medium**)
  - *Mitigation:* Add multilingual support or clearly communicate language limitations
- **MAP-2:** Potential for customers to manipulate chatbot into unauthorized refunds (Likelihood: Medium, Impact: High, Risk: **High**)
  - *Mitigation:* Implement rule-based controls on refund amounts; require human approval for refunds >$100

**Recommendations:**
1. Test chatbot with multilingual queries and document limitations
2. Implement refund authorization controls
3. Monitor for attempted manipulation

### MEASURE Findings:

**Current Metrics:**
- Accuracy: 87% intent classification accuracy; 92% customer satisfaction on resolved queries
- Fairness: Not measured
- Robustness: No adversarial testing conducted
- Explainability: Limited - chatbot doesn't explain reasoning
- Privacy: PII redaction implemented; conversations logged for 90 days

**Identified Risks:**
- **MEAS-1:** No fairness testing across customer demographics (Likelihood: Medium, Impact: High, Risk: **High**)
  - *Mitigation:* Conduct fairness analysis by customer age, language preference, and product category
- **MEAS-2:** No adversarial testing for prompt injection or jailbreak attempts (Likelihood: High, Impact: Medium, Risk: **Medium**)
  - *Mitigation:* Conduct red-team testing for adversarial prompts
- **MEAS-3:** Chatbot doesn't explain why it escalates to human agent (Likelihood: High, Impact: Low, Risk: **Low**)
  - *Mitigation:* Add explanation when escalating ("This request requires manager approval")

**Recommendations:**
1. Conduct fairness testing across demographic groups
2. Perform adversarial robustness testing
3. Add basic explainability for escalations

### MANAGE Findings:

**Risk Prioritization:**
1. **GOV-2** (High): No AI ethics review
2. **MAP-2** (High): Refund manipulation risk
3. **MEAS-1** (High): No fairness testing
4. **GOV-1** (Medium): No AI owner
5. **MAP-1** (Medium): Multilingual limitations

**Mitigation Strategy:**

| Risk | Treatment | Controls | Timeline |
|------|-----------|----------|----------|
| GOV-2 | Mitigate | Establish AI Ethics Review Board | 30 days |
| MAP-2 | Mitigate | Implement refund approval workflow for >$100 | 14 days |
| MEAS-1 | Mitigate | Conduct fairness testing; remediate if needed | 60 days |
| GOV-1 | Mitigate | Assign AI System Owner | 14 days |
| MAP-1 | Mitigate | Add multilingual support or document limitations | 90 days |

**Incident Response:**
- Current: No AI-specific incident response plan
- Recommendation: Create incident response plan covering: discriminatory outputs, privacy breaches, harmful recommendations, system failures

**Next Steps:**
1. **Immediate (0-14 days):** Assign AI System Owner; implement refund controls
2. **Short-term (14-60 days):** Establish AI Ethics Review Board; conduct fairness testing
3. **Long-term (60-90 days):** Address multilingual limitations; implement continuous monitoring

**Residual Risk:**
After mitigations, residual risk is **Low to Moderate**. Main residual risk is potential for sophisticated prompt injection attacks; accepted with monitoring.

</examples>
```

## Usage Instructions

This is a comprehensive prompt that will take 15-20 minutes to complete. Follow these steps:

### 1. Prepare System Information

Before running the assessment, gather:
- **System documentation:** Architecture, data flow diagrams, model cards
- **Performance metrics:** Accuracy, fairness, robustness test results (if available)
- **Governance documentation:** Policies, roles, responsibilities
- **Stakeholder information:** Who develops, uses, and is affected by the system

### 2. Fill in System Context Variables

Replace the variables in the `<ai_system>` section:
- `{{SYSTEM_NAME}}`: Your AI system's name
- `{{SYSTEM_PURPOSE}}`: What the system does (1-2 sentences)
- `{{DEPLOYMENT_CONTEXT}}`: Where/how it's deployed
- `{{DATA_SOURCES}}`: What data it uses
- `{{STAKEHOLDERS}}`: Who's involved/affected

### 3. Provide Additional Context

After pasting the prompt, provide any additional information:
- Existing risk assessments or audits
- Known issues or incidents
- Regulatory requirements
- Organizational constraints

### 4. Review Each Function

The AI will assess your system across all four functions (GOVERN, MAP, MEASURE, MANAGE). Review each section carefully.

### 5. Iterate and Refine

Ask follow-up questions to:
- Get more detail on specific risks
- Explore alternative mitigations
- Prioritize recommendations
- Understand risk scoring rationale

### 6. Document and Act

- Export the risk assessment
- Share with stakeholders
- Create action plan for recommendations
- Schedule periodic reassessments (recommended: quarterly for high-risk systems, annually for low-risk)

## Expected Output

The output will be a **comprehensive risk assessment document** (typically 3-5 pages) with:

1. **Executive Summary:** High-level findings and recommendations for executives/stakeholders
2. **Function-by-Function Analysis:** Detailed assessment of GOVERN, MAP, MEASURE, MANAGE with identified risks
3. **Risk Register:** Consolidated table of all risks with likelihood, impact, and scores
4. **Mitigation Strategy:** Specific, actionable recommendations with timelines
5. **Residual Risk Assessment:** Understanding of what risks remain after mitigations

The assessment provides:
- **Structured risk identification** across all AI risk categories
- **Quantified risk levels** (High/Medium/Low) for prioritization
- **Actionable recommendations** with clear ownership and timelines
- **Audit trail** for governance, compliance, and stakeholder communication

## Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `{{SYSTEM_NAME}}` | Name of the AI system | "FraudDetect AI" |
| `{{SYSTEM_PURPOSE}}` | What the system does | "Detect fraudulent transactions in real-time for credit card purchases" |
| `{{DEPLOYMENT_CONTEXT}}` | Where/how deployed | "Production environment processing 10M transactions/day; integrated with payment gateway" |
| `{{DATA_SOURCES}}` | Training and operational data | "Historical transaction data (2019-2024, 50M transactions), merchant data, user behavior patterns" |
| `{{STAKEHOLDERS}}` | Who's involved/affected | "Customers, merchants, fraud analysts, compliance team, payment processors" |

## Tips for Better Results

### Focus on High-Risk Systems First

Not all AI systems need comprehensive NIST AI RMF assessments. Prioritize:
- **High-risk systems:** Those affecting safety, fundamental rights, or critical decisions (hiring, lending, healthcare)
- **Public-facing systems:** Customer-facing AI with broad user base
- **Regulated systems:** AI subject to regulatory scrutiny (financial services, healthcare)

For low-risk systems (e.g., internal productivity tools), a lighter assessment may suffice.

### Be Specific About Context

The quality of risk assessment depends on specificity. Provide:
- **Concrete use cases:** Not "recommendation system" but "product recommendation for e-commerce with 500K users"
- **Real data characteristics:** Not "customer data" but "transaction history, browsing behavior, demographic data from signup forms"
- **Actual deployment:** Not "cloud-based" but "AWS EKS with autoscaling, 99.9% SLA requirement"

### Don't Skip GOVERN

Many organizations focus on technical risks (MAP, MEASURE) and skip governance (GOVERN). This is a mistake. Governance failures are the root cause of most AI incidents. Ensure:
- Clear accountability structures
- Written policies and procedures
- Executive oversight
- Diverse perspectives in AI development

### Measure What Matters

MEASURE risks are only meaningful if you're tracking the right metrics. For your system, determine which trustworthy AI characteristics matter most:
- **Fairness** is critical for systems affecting individuals (hiring, lending, criminal justice)
- **Robustness** is critical for safety-critical systems (autonomous vehicles, medical diagnosis)
- **Privacy** is critical for systems handling PII or sensitive data
- **Explainability** is critical for high-stakes decisions requiring human understanding

Don't just measure everything - focus on what's material to your system's risks.

### Iterate Over Time

AI risk assessment is not one-and-done. The NIST AI RMF emphasizes continuous risk management:
- **Initial assessment:** Before deployment
- **Periodic reassessments:** Quarterly for high-risk, annually for low-risk
- **Event-triggered reassessments:** After incidents, major updates, or changes in context
- **Continuous monitoring:** Ongoing tracking of key metrics

### Leverage the Generative AI Profile

If your system uses generative AI (LLMs, image generators, etc.), also reference **NIST AI 600-1 Generative AI Profile** for additional risks:
- **Confabulation/Hallucination:** Model generates false information
- **Dangerous or Violent Content:** Model generates harmful outputs
- **Information Integrity:** Issues with content provenance and synthetic media
- **Harmful Bias and Homogenization:** Reinforcement of stereotypes
- **CBRN Information:** Chemical, biological, radiological, nuclear information risks
- **Data Privacy:** Training data leakage, PII exposure

### Align with Enterprise Risk Management

Don't treat AI risk management as separate from enterprise risk management. Integrate:
- Use existing risk scoring methodologies (if your org uses 1-5 risk scores, use those)
- Report AI risks to the same governance bodies (e.g., Risk Committee)
- Coordinate with existing risk functions (IT risk, compliance, legal)

## Related Prompts

Future prompts in development:
- **Generative AI Risk Assessment** - Using NIST AI 600-1 Generative AI Profile
- **AI Model Card Generation** - Document model characteristics per NIST guidance
- **AI Incident Response** - Respond to AI system failures or harms
- **Fairness Testing** - Quantitative fairness assessment across demographic groups

## Version History

- **1.0** (2026-01-27): Initial NIST AI RMF risk assessment prompt

## Changelog

| Date | Version | Changes |
|------|---------|---------|
| 2026-01-27 | 1.0 | Initial release with comprehensive GOVERN, MAP, MEASURE, MANAGE assessment |

## Sources

- [NIST AI RMF 1.0](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf) - AI Risk Management Framework (January 2023)
- [NIST AI 600-1](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf) - Generative AI Profile (July 2024)
- [AI RMF Playbook](https://airc.nist.gov/AI_RMF_Knowledge_Base/Playbook) - Implementation guidance
- [Trustworthy and Responsible AI Resource Center](https://airc.nist.gov/) - NIST AI resources
