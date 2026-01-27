---
title: "AI Risk Assessment Framework"
type: "Framework"
version: "1.0"
framework_alignment:
  - "NIST AI RMF 1.0"
  - "ISO/IEC 42001:2023"
  - "EU AI Act"
last_updated: "2026-01-27"
author: "Community"
complexity: "Advanced"
estimated_customization_time: "4-6 hours"
variables:
  - name: "ORGANIZATION_NAME"
    description: "Legal name of your organization"
    required: true
    example: "Acme Corporation"
  - name: "EFFECTIVE_DATE"
    description: "Date when framework becomes effective"
    required: true
    example: "2026-03-01"
  - name: "CLASSIFICATION"
    description: "Document classification level"
    required: true
    example: "Internal"
  - name: "FRAMEWORK_OWNER"
    description: "Name and title of framework owner"
    required: true
    example: "Jane Smith, Chief Risk Officer"
  - name: "APPROVER"
    description: "Name and title of approving authority"
    required: true
    example: "John Doe, Chief Executive Officer"
  - name: "RISK_COMMITTEE"
    description: "Name of risk oversight committee"
    required: false
    example: "AI Risk and Ethics Committee"
  - name: "RISK_REGISTER_LOCATION"
    description: "Where AI risk register is maintained"
    required: true
    example: "company GRC platform at https://grc.acme.com/ai-risks"
  - name: "RISK_TOLERANCE_CRITICAL"
    description: "Threshold for critical risk (0-100 scale)"
    required: false
    example: "80"
  - name: "RISK_TOLERANCE_HIGH"
    description: "Threshold for high risk (0-100 scale)"
    required: false
    example: "60"
  - name: "RISK_TOLERANCE_MEDIUM"
    description: "Threshold for medium risk (0-100 scale)"
    required: false
    example: "30"
---

# AI Risk Assessment Framework

## Document Control

| Attribute | Value |
|-----------|-------|
| **Organization** | {{ORGANIZATION_NAME}} |
| **Effective Date** | {{EFFECTIVE_DATE}} |
| **Version** | 1.0 |
| **Classification** | {{CLASSIFICATION}} |
| **Framework Owner** | {{FRAMEWORK_OWNER}} |
| **Approved By** | {{APPROVER}} |
| **Last Updated** | 2026-01-27 |

## 1. Purpose and Scope

### 1.1 Purpose

This framework establishes a systematic approach for identifying, assessing, mitigating, and monitoring risks associated with Artificial Intelligence (AI) systems at {{ORGANIZATION_NAME}}.

The framework enables:
- Consistent risk assessment across all AI systems and use cases
- Informed decision-making about AI adoption and deployment
- Compliance with AI governance frameworks (NIST AI RMF, ISO 42001, EU AI Act)
- Proactive risk management throughout the AI lifecycle
- Accountability and transparency in AI risk governance

### 1.2 Scope

This framework applies to:

**AI Systems in Scope**:
- AI systems under development (internal development or vendor procurement)
- AI systems in production use
- Pilot or proof-of-concept AI projects
- Third-party AI services integrated into {{ORGANIZATION_NAME}} operations
- AI systems processing {{ORGANIZATION_NAME}} or customer data

**Risk Categories Covered**:
- Bias and fairness risks
- Privacy and data protection risks
- Security and adversarial risks
- Safety and reliability risks
- Transparency and explainability limitations
- Compliance and legal risks
- Ethical and reputational risks

**Lifecycle Stages**:
- Problem definition and scoping
- Data acquisition and preparation
- Model development and training
- Testing and validation
- Deployment and integration
- Monitoring and maintenance
- Retirement and decommissioning

### 1.3 Framework Alignment

This framework aligns with:

**NIST AI RMF 1.0**:
- **GOVERN**: Risk governance and accountability (Section 3)
- **MAP**: Context and risk identification (Sections 4-5)
- **MEASURE**: Risk assessment and analysis (Section 6)
- **MANAGE**: Risk mitigation and monitoring (Sections 7-8)

**ISO/IEC 42001:2023**:
- Clause 6.1: Actions to address risks and opportunities
- Clause 8.1: Operational planning and control
- Clause 9.1: Monitoring, measurement, analysis and evaluation

**EU AI Act**:
- Article 9: Risk management system for high-risk AI systems
- Annex III: High-risk AI system categorization

## 2. Risk Governance (GOVERN)

### 2.1 Risk Governance Structure

**{{RISK_COMMITTEE}}**:
- **Charter**: Provides oversight of AI risk management activities
- **Composition**: Chief Risk Officer (chair), CISO, CTO, General Counsel, Chief Privacy Officer, Data Science Lead, Business Unit Representatives
- **Meeting Cadence**: Quarterly, with ad-hoc sessions for critical risk reviews
- **Reporting Line**: Reports to Executive Committee and Board Risk Committee

**Responsibilities**:
- Establish and maintain AI risk appetite and tolerance
- Review and approve high-risk AI systems
- Monitor AI risk portfolio and trends
- Ensure adequacy of risk mitigation strategies
- Escalate unacceptable risks to executive leadership
- Review risk assessment framework effectiveness annually

### 2.2 Risk Appetite and Tolerance

{{ORGANIZATION_NAME}}'s AI risk appetite defines acceptable levels of risk:

**Risk Appetite Statement**:
{{ORGANIZATION_NAME}} will adopt AI technologies to achieve business objectives while maintaining risks within acceptable tolerances. We accept:
- **Low-to-medium risks** for AI systems that enhance operational efficiency with limited customer impact
- **Medium risks** for AI systems that inform human decision-making (decision support)
- **Minimal risks only** for AI systems that make autonomous decisions affecting customers, employees, or public safety

**Risk Tolerance Thresholds** (on 0-100 scale):
- **Critical Risk** ({{RISK_TOLERANCE_CRITICAL}}+): Not acceptable - Must be mitigated before deployment or system must be discontinued
- **High Risk** ({{RISK_TOLERANCE_HIGH}}-{{RISK_TOLERANCE_CRITICAL}}): Requires executive approval and enhanced controls
- **Medium Risk** ({{RISK_TOLERANCE_MEDIUM}}-{{RISK_TOLERANCE_HIGH}}): Requires risk committee approval and standard controls
- **Low Risk** (<{{RISK_TOLERANCE_MEDIUM}}): Acceptable with documented mitigation plan

### 2.3 Roles and Responsibilities

| Role | AI Risk Responsibilities |
|------|--------------------------|
| **{{RISK_COMMITTEE}}** | Establish risk appetite, approve high-risk systems, monitor risk portfolio |
| **{{FRAMEWORK_OWNER}}** | Maintain framework, coordinate assessments, report on risk trends |
| **AI System Owner** | Initiate risk assessment, implement controls, monitor ongoing risks |
| **Risk Assessor** | Conduct risk assessments using this framework, document findings |
| **Data Science/AI Team** | Provide technical input on AI capabilities and limitations |
| **Information Security** | Assess security and adversarial risks |
| **Privacy/Legal** | Assess privacy, compliance, and legal risks |
| **Business Units** | Identify use cases, define requirements, validate risk impact |
| **Internal Audit** | Audit risk assessment process and control effectiveness |

### 2.4 Accountability

Each AI system must have:
- **System Owner**: Accountable for overall system risk and compliance
- **Technical Lead**: Responsible for technical implementation and model performance
- **Business Sponsor**: Accountable for business value and use case appropriateness

Accountability is documented in the AI Risk Register (see Section 9).

## 3. AI System Categorization

### 3.1 Categorization Criteria

AI systems are categorized by risk level based on:

**Impact Factors**:
- Decision consequence (advisory → automated consequential decisions)
- Data sensitivity (public → restricted/PII/PHI)
- User population size (pilot → enterprise-wide)
- Reversibility (easily reversible → irreversible decisions)
- Human oversight level (continuous → minimal)

**AI System Risk Categories**:

| Category | Definition | Examples | Default Risk Level |
|----------|------------|----------|-------------------|
| **Minimal Risk** | AI with negligible impact on rights, safety, or organization | Spam filters, grammar checkers, content recommendations | Low |
| **Limited Risk** | AI with limited impact requiring transparency | Chatbots, synthetic media generation, customer service bots | Low-Medium |
| **High Risk** | AI affecting fundamental rights, safety, or critical decisions | Employment screening, credit decisioning, fraud detection, biometric identification | High |
| **Unacceptable Risk** | AI creating unacceptable threats | Social scoring, real-time biometric surveillance (public spaces), subliminal manipulation | Critical (Prohibited) |

### 3.2 EU AI Act High-Risk Categories

If deploying AI in the EU, assess against Annex III high-risk categories:
1. Biometrics and biometric identification
2. Critical infrastructure management
3. Education and vocational training (admission, assessment)
4. Employment, workers management, and access to self-employment
5. Access to essential private and public services (credit scoring, emergency dispatch)
6. Law enforcement
7. Migration, asylum, and border control management
8. Administration of justice and democratic processes

**High-risk categorization triggers enhanced requirements** (Article 9-15): risk management, data governance, technical documentation, transparency, human oversight, accuracy, robustness.

### 3.3 Categorization Process

1. AI System Owner completes AI System Categorization Questionnaire
2. Risk Assessor reviews responses and assigns preliminary category
3. For High Risk or Unacceptable Risk: {{RISK_COMMITTEE}} reviews and confirms
4. Category documented in AI System Inventory and Risk Register

## 4. Risk Identification (MAP)

### 4.1 AI Risk Categories

AI systems are assessed across these risk dimensions:

#### 4.1.1 Bias and Fairness Risks

**Definition**: AI system produces discriminatory outcomes or systematically disadvantages protected groups.

**Risk Factors**:
- Training data contains historical bias or is unrepresentative
- Features correlate with protected characteristics (race, gender, age, disability)
- Model amplifies existing societal biases
- No fairness metrics or testing performed
- Deployment context differs from training context

**Potential Impacts**:
- Discriminatory decisions (hiring, lending, insurance)
- Violation of anti-discrimination laws
- Reputational damage and loss of trust
- Legal liability and regulatory penalties

**Example Scenarios**:
- Resume screening AI trained on historical hiring data that reflects past discrimination
- Credit scoring model that disadvantages applicants from certain ZIP codes
- Healthcare AI that performs poorly on underrepresented demographic groups

#### 4.1.2 Privacy and Data Protection Risks

**Definition**: AI system violates privacy rights or fails to protect personal data.

**Risk Factors**:
- Processing of PII, PHI, or sensitive personal data
- Inadequate data minimization or anonymization
- Third-party AI vendor with unclear data usage
- Training on data without proper consent or legal basis
- Data processed in jurisdictions with weak privacy protections
- Re-identification risk from aggregated or anonymized data

**Potential Impacts**:
- GDPR, CCPA, HIPAA violations
- Unauthorized data disclosure or breach
- Inability to honor data subject rights (deletion, access, portability)
- Regulatory fines and legal action

**Example Scenarios**:
- Generative AI trained on customer support transcripts containing PII
- AI vendor uses customer data to improve models without consent
- Model outputs reveal sensitive information about training data (privacy leakage)

#### 4.1.3 Security and Adversarial Risks

**Definition**: AI system is vulnerable to attacks or can be exploited by adversaries.

**Risk Factors**:
- Model poisoning (attacker manipulates training data)
- Adversarial examples (inputs designed to fool model)
- Model extraction or theft (attacker replicates proprietary model)
- Backdoors inserted during training
- Prompt injection attacks (LLMs)
- Insufficient access controls or authentication
- Lack of input validation

**Potential Impacts**:
- Model produces incorrect or manipulated outputs
- Unauthorized access to model or training data
- Intellectual property theft
- Safety incidents from manipulated outputs
- System unavailability (denial of service)

**Example Scenarios**:
- Attacker adds misleading examples to training data to create model backdoor
- Adversarial inputs cause fraud detection system to miss fraudulent transactions
- Prompt injection causes LLM to leak confidential information

#### 4.1.4 Safety and Reliability Risks

**Definition**: AI system failures or inaccuracies cause harm or unsafe conditions.

**Risk Factors**:
- Deployed in safety-critical environment (healthcare, transportation, infrastructure)
- Model performance degrades over time (data drift, concept drift)
- Insufficient testing on edge cases and failure modes
- Lack of redundancy or fail-safe mechanisms
- No monitoring of real-world performance
- Opaque failure modes (difficult to diagnose)

**Potential Impacts**:
- Physical harm or injury
- Property damage
- Service outages or degraded operations
- Financial losses
- Erosion of user trust

**Example Scenarios**:
- Medical diagnosis AI misses early cancer signs (false negative)
- Autonomous vehicle system fails to detect pedestrian in unusual lighting
- Predictive maintenance AI fails to flag equipment failures (leading to downtime)

#### 4.1.5 Transparency and Explainability Risks

**Definition**: Inability to explain AI decisions or understand how system reaches conclusions.

**Risk Factors**:
- Use of complex "black box" models (deep neural networks)
- No explanation mechanism for individual predictions
- Insufficient documentation of model design and training
- Stakeholders unable to understand or validate AI outputs
- Regulatory requirement for explainability (e.g., GDPR Article 22, fair lending laws)

**Potential Impacts**:
- Inability to debug or improve model
- Regulatory non-compliance (right to explanation)
- Loss of user trust and acceptance
- Difficulty auditing for bias or errors
- Legal liability when decisions cannot be justified

**Example Scenarios**:
- Loan denial that cannot be explained to applicant (fair lending violation)
- Healthcare AI recommendation that clinician cannot validate or trust
- Employment decision based on opaque AI scoring that violates labor laws

#### 4.1.6 Compliance and Legal Risks

**Definition**: AI system violates laws, regulations, or contractual obligations.

**Risk Factors**:
- Applicable regulations not identified (GDPR, AI Act, sector-specific rules)
- Insufficient legal review of use case
- Intellectual property concerns (training data licensing, copyright)
- Contractual restrictions on data usage or automation
- Lack of required assessments (DPIA, fundamental rights impact assessment)

**Potential Impacts**:
- Regulatory fines and penalties
- Lawsuits and legal settlements
- Injunctions requiring system shutdown
- Reputational damage

**Example Scenarios**:
- EU AI Act high-risk system deployed without required conformity assessment
- AI trained on copyrighted content without license
- Automated employment decision violating labor laws requiring human involvement

#### 4.1.7 Ethical and Reputational Risks

**Definition**: AI system usage conflicts with organizational values or harms reputation.

**Risk Factors**:
- Use case conflicts with ethical norms or values
- Potential for harm to vulnerable populations
- Use in controversial contexts (surveillance, scoring, manipulation)
- Misalignment with customer expectations
- Poor stakeholder communication about AI usage

**Potential Impacts**:
- Reputational damage and brand harm
- Customer attrition and boycotts
- Employee morale issues
- Media criticism and negative publicity
- Loss of competitive advantage

**Example Scenarios**:
- Customer backlash against opaque AI-driven pricing (surge pricing)
- AI used in employee monitoring perceived as excessive surveillance
- Generative AI creates misleading content harming public trust

### 4.2 Risk Identification Methods

Use these methods to identify AI risks:

1. **AI System Inventory Review**: Review all AI systems in inventory for risk assessment currency
2. **Risk Workshops**: Facilitated sessions with cross-functional stakeholders
3. **Risk Questionnaires**: Structured questionnaires for system owners (see Appendix A)
4. **Historical Incident Analysis**: Learn from past AI incidents (internal and industry)
5. **Threat Modeling**: Identify attack vectors and adversarial risks
6. **Regulatory Mapping**: Map requirements to system capabilities
7. **Stakeholder Input**: Gather concerns from users, customers, advocacy groups
8. **Horizon Scanning**: Monitor emerging AI risks and research

### 4.3 AI System Context Analysis

Document AI system context (NIST AI RMF MAP function):

**Technical Context**:
- AI technique (supervised learning, LLM, computer vision, etc.)
- Model architecture and complexity
- Training data sources and characteristics
- Performance metrics (accuracy, precision, recall, fairness metrics)

**Use Context**:
- Business purpose and objectives
- User population and demographics
- Decision type (automated, assisted, advisory)
- Frequency of use and scale

**Deployment Context**:
- Operating environment (cloud, on-premise, edge)
- Integration points with other systems
- Human oversight mechanisms
- Monitoring and alerting capabilities

**Regulatory Context**:
- Applicable laws and regulations
- Industry standards and best practices
- Contractual obligations
- Geographic deployment scope (jurisdictions)

## 5. Risk Assessment Process (MEASURE)

### 5.1 Risk Assessment Methodology

AI risks are assessed using a **Likelihood x Impact** matrix.

#### 5.1.1 Likelihood Assessment

Rate the probability that the risk will materialize:

| Rating | Likelihood | Description | Probability |
|--------|-----------|-------------|-------------|
| 1 | Rare | Highly unlikely under normal circumstances | <5% |
| 2 | Unlikely | Could occur but not expected | 5-25% |
| 3 | Possible | Reasonable chance of occurring | 25-50% |
| 4 | Likely | Expected to occur in most circumstances | 50-75% |
| 5 | Almost Certain | Expected to occur regularly | >75% |

**Factors Increasing Likelihood**:
- Insufficient testing or validation
- Poor data quality or unrepresentative data
- Complex model with limited interpretability
- Lack of monitoring or alerting
- Inadequate access controls
- Known vulnerabilities in AI platform

#### 5.1.2 Impact Assessment

Rate the severity of consequences if risk materializes:

| Rating | Impact | Description | Consequences |
|--------|--------|-------------|--------------|
| 1 | Negligible | Minimal impact, easily corrected | Minor inconvenience, no harm |
| 2 | Minor | Limited impact, correctable without major effort | Temporary service degradation, minor customer complaints |
| 3 | Moderate | Noticeable impact requiring response | Service disruption, customer churn, moderate financial loss |
| 4 | Major | Significant impact requiring substantial resources | Regulatory inquiry, significant financial loss, brand damage |
| 5 | Severe | Catastrophic impact threatening organization | Major regulatory fines, litigation, safety incidents, existential threat |

**Impact Dimensions to Consider**:
- **Safety**: Physical harm, injury, or unsafe conditions
- **Financial**: Direct costs, fines, lost revenue
- **Legal/Compliance**: Regulatory penalties, litigation costs
- **Reputational**: Brand damage, customer trust erosion
- **Operational**: Service disruptions, inability to operate
- **Strategic**: Loss of competitive advantage, market position

#### 5.1.3 Risk Score Calculation

**Risk Score** = Likelihood x Impact (range: 1-25)

**Risk Level Mapping**:
- **Critical** (20-25): Immediate action required
- **High** (12-19): Priority mitigation within 30 days
- **Medium** (6-11): Mitigation within 90 days
- **Low** (1-5): Accept or mitigate opportunistically

**Risk Matrix**:

| Likelihood / Impact | Negligible (1) | Minor (2) | Moderate (3) | Major (4) | Severe (5) |
|---------------------|----------------|-----------|--------------|-----------|------------|
| **Almost Certain (5)** | Medium (5) | Medium (10) | High (15) | Critical (20) | Critical (25) |
| **Likely (4)** | Low (4) | Medium (8) | High (12) | High (16) | Critical (20) |
| **Possible (3)** | Low (3) | Medium (6) | Medium (9) | High (12) | High (15) |
| **Unlikely (2)** | Low (2) | Low (4) | Medium (6) | Medium (8) | High (10) |
| **Rare (1)** | Low (1) | Low (2) | Low (3) | Low (4) | Medium (5) |

### 5.2 Inherent vs. Residual Risk

**Inherent Risk**: Risk level before considering existing controls (likelihood x impact with no mitigation)

**Residual Risk**: Risk level after applying mitigation controls (likelihood x impact with controls in place)

**Process**:
1. Assess **inherent risk** based on AI system characteristics and context
2. Identify existing controls and mitigations
3. Reassess **residual risk** considering control effectiveness
4. If residual risk exceeds tolerance, identify additional controls
5. Calculate **target residual risk** with planned additional controls

### 5.3 Risk Assessment Frequency

| AI System Risk Level | Assessment Frequency |
|---------------------|----------------------|
| **Critical/High Risk** | Quarterly or upon material change |
| **Medium Risk** | Annually or upon material change |
| **Low Risk** | Every 2 years or upon material change |

**Material changes triggering re-assessment**:
- Model retraining or architecture change
- New data sources or data distribution shifts
- Expansion to new use cases or user populations
- Changes in regulatory environment
- Security incidents or vulnerability discoveries
- Performance degradation detected

## 6. Risk Mitigation (MANAGE)

### 6.1 Risk Treatment Options

For each identified risk, select treatment strategy:

#### Option 1: Mitigate (Reduce)

Implement controls to reduce likelihood or impact.

**Common AI Risk Controls**:
- **Bias Mitigation**: Diverse training data, fairness testing, bias correction algorithms, human review of edge cases
- **Privacy Protection**: Data minimization, anonymization, differential privacy, federated learning, on-premise deployment
- **Security Controls**: Input validation, adversarial testing, model watermarking, access controls, encryption
- **Transparency**: Model documentation, explanation mechanisms (LIME, SHAP), decision logs, audit trails
- **Safety**: Extensive testing, fail-safe mechanisms, confidence thresholds, human-in-the-loop, redundancy
- **Monitoring**: Performance dashboards, drift detection, anomaly alerts, feedback loops

#### Option 2: Avoid (Eliminate)

Eliminate the risk by not pursuing the AI use case or selecting alternative approach.

**When to Avoid**:
- Residual risk exceeds appetite even with maximum mitigation
- Cost of controls outweighs business value
- Regulatory uncertainty makes compliance unclear
- Ethical concerns cannot be adequately addressed

#### Option 3: Transfer (Share)

Transfer risk to third party (insurance, vendor contractual terms, outsourcing).

**Transfer Mechanisms**:
- AI liability insurance
- Vendor indemnification clauses
- Service Level Agreements (SLAs) with penalties
- Shared responsibility model (cloud AI services)

**Limitations**: Cannot transfer reputational risk or regulatory accountability.

#### Option 4: Accept

Acknowledge risk and proceed without additional mitigation (for low risks within tolerance).

**Acceptance Criteria**:
- Risk score below tolerance threshold
- Cost of mitigation exceeds risk impact
- No further cost-effective controls available
- Explicit approval by {{RISK_COMMITTEE}} (for medium+ risks)

### 6.2 Control Selection Framework

Select controls based on:

| Risk Category | Primary Controls | Secondary Controls |
|---------------|------------------|--------------------|
| **Bias & Fairness** | Diverse training data, fairness metrics, disparate impact testing | Human review of high-stakes decisions, bias audits, stakeholder input |
| **Privacy** | Data minimization, anonymization, DPA with vendors | Differential privacy, federated learning, on-premise deployment |
| **Security** | Input validation, access controls, encryption at rest/transit | Adversarial testing, penetration testing, bug bounty, security monitoring |
| **Safety & Reliability** | Extensive testing (unit, integration, UAT), performance monitoring | Redundancy, fail-safe mechanisms, confidence thresholds, human oversight |
| **Transparency** | Model documentation, decision logs | Explainability tools (SHAP, LIME), audit trails, transparency reports |
| **Compliance** | Legal review, regulatory mapping, required assessments (DPIA, FRIA) | Compliance monitoring, regulatory change tracking |
| **Ethical & Reputational** | Ethical review, stakeholder consultation | Transparency communication, impact assessment, third-party audit |

### 6.3 Residual Risk Acceptance

After implementing controls:

1. **Calculate Residual Risk**: Reassess likelihood and impact with controls
2. **Compare to Tolerance**: Check against risk appetite thresholds
3. **Approval Required**:
   - **Low residual risk**: AI System Owner approval
   - **Medium residual risk**: {{RISK_COMMITTEE}} approval
   - **High residual risk**: {{RISK_COMMITTEE}} + Executive Leadership approval
   - **Critical residual risk**: Not acceptable - additional mitigation or avoid
4. **Document Acceptance**: Record in AI Risk Register with approver, date, and conditions

### 6.4 Continuous Monitoring

Implement continuous monitoring for:

**Performance Monitoring**:
- Accuracy, precision, recall trends over time
- Fairness metrics across demographic groups
- False positive/negative rates

**Operational Monitoring**:
- System availability and response times
- Error rates and failure modes
- User feedback and complaints

**Security Monitoring**:
- Unusual access patterns or queries
- Adversarial input attempts
- Vulnerability scanning results

**Compliance Monitoring**:
- Regulatory changes affecting AI system
- Control effectiveness (audit results)
- Policy violations or incidents

**Data Drift Detection**:
- Training data vs. production data distribution
- Concept drift (relationship between features and outcome changes)
- Trigger retraining or risk re-assessment when drift detected

## 7. AI Risk Register

### 7.1 Risk Register Purpose

The AI Risk Register is the centralized repository for all identified AI risks, assessments, and mitigation plans.

**Location**: {{RISK_REGISTER_LOCATION}}

**Purpose**:
- Provide single source of truth for AI risk portfolio
- Enable trend analysis and reporting
- Support audit and compliance requirements
- Facilitate risk committee oversight

### 7.2 Risk Register Structure

Each risk entry includes:

| Field | Description |
|-------|-------------|
| **Risk ID** | Unique identifier (e.g., AI-RISK-2026-001) |
| **AI System** | Name and ID of AI system |
| **Risk Category** | Bias, Privacy, Security, Safety, Transparency, Compliance, Ethical |
| **Risk Description** | Clear statement of what could go wrong |
| **Risk Owner** | Individual accountable for managing this risk |
| **Inherent Likelihood** | 1-5 scale (before controls) |
| **Inherent Impact** | 1-5 scale (before controls) |
| **Inherent Risk Score** | Likelihood x Impact (before controls) |
| **Existing Controls** | List of current mitigations |
| **Residual Likelihood** | 1-5 scale (with current controls) |
| **Residual Impact** | 1-5 scale (with current controls) |
| **Residual Risk Score** | Likelihood x Impact (with controls) |
| **Risk Treatment** | Mitigate / Avoid / Transfer / Accept |
| **Planned Controls** | Additional mitigations planned |
| **Target Residual Risk** | Expected risk score with planned controls |
| **Control Implementation Date** | When controls will be in place |
| **Approval Status** | Pending / Approved / Rejected |
| **Approver** | Name and date of approval |
| **Next Review Date** | When risk will be reassessed |
| **Status** | Open / In Progress / Closed |
| **Last Updated** | Date of last risk update |

### 7.3 Risk Register Governance

**Maintenance**: {{FRAMEWORK_OWNER}} maintains risk register
**Review**: {{RISK_COMMITTEE}} reviews quarterly
**Access**: System owners update their system risks; read access for stakeholders
**Reporting**: Risk portfolio dashboards and trends presented to leadership

## 8. Review and Escalation

### 8.1 Risk Escalation Triggers

Escalate to {{RISK_COMMITTEE}} when:
- Residual risk score exceeds tolerance threshold
- New high or critical risk identified
- Material change to existing risk (score increases by 50%+)
- Control failure or ineffectiveness discovered
- AI incident occurs (bias, breach, safety issue)
- Regulatory inquiry related to AI system

### 8.2 Incident Response

When AI-related incident occurs:

1. **Immediate Response**:
   - Contain incident (disable system if necessary)
   - Notify {{FRAMEWORK_OWNER}} and {{RISK_COMMITTEE}}
   - Initiate incident response process

2. **Investigation**:
   - Determine root cause
   - Assess impact (customers affected, data involved, harm caused)
   - Identify control failures

3. **Remediation**:
   - Implement corrective actions
   - Update controls and risk assessment
   - Consider whether system should remain in production

4. **Reporting**:
   - Regulatory notifications if required
   - Customer notifications if required
   - Internal reporting to leadership and board

5. **Lessons Learned**:
   - Document incident and response
   - Update risk register
   - Share learnings across AI system portfolio

### 8.3 Framework Review

This framework is reviewed:
- **Annually**: Scheduled review by {{FRAMEWORK_OWNER}} and {{RISK_COMMITTEE}}
- **Ad-hoc**: When triggered by major AI incident, regulatory changes, or framework ineffectiveness

Updates require {{APPROVER}} approval.

## 9. Roles and Approvals

### 9.1 Assessment and Approval Matrix

| Residual Risk Level | Risk Assessment | Risk Acceptance | Control Budget Approval |
|---------------------|-----------------|-----------------|------------------------|
| **Low** | Risk Assessor | AI System Owner | Manager |
| **Medium** | Risk Assessor + Security/Privacy | {{RISK_COMMITTEE}} | Director |
| **High** | Cross-functional team | {{RISK_COMMITTEE}} + Executive Leadership | VP / C-level |
| **Critical** | Cross-functional team + external review | Board Risk Committee | C-level / Board |

### 9.2 Documentation Requirements

All AI risk assessments must include:
- Completed risk assessment questionnaire (Appendix A)
- Risk scoring with justification
- Control inventory and effectiveness evaluation
- Residual risk calculation
- Treatment plan with timeline
- Approval signatures

Store in AI Risk Register with audit trail.

## Appendix A: AI Risk Assessment Questionnaire

Use this questionnaire to identify and assess AI system risks.

### A.1 System Information

1. AI System Name: _______________
2. System Owner: _______________
3. Business Purpose: _______________
4. AI Technique (ML, LLM, computer vision, etc.): _______________
5. Development Stage (proof-of-concept, pilot, production): _______________

### A.2 Use Context

6. What decisions does the AI system make or inform?
7. Are decisions automated or do humans review AI outputs?
8. What is the consequence if AI makes an error (false positive or false negative)?
9. How many people are affected by the AI system? (users, customers, employees)
10. In what geographic regions is the AI deployed?

### A.3 Data and Training

11. What data is used to train the AI model? (sources, volume, time period)
12. Does training data contain PII, PHI, or sensitive data?
13. Is training data representative of production use cases and populations?
14. Have you identified potential biases in training data?
15. What is the data quality level (completeness, accuracy, consistency)?

### A.4 Bias and Fairness

16. Could the AI system produce discriminatory outcomes based on race, gender, age, disability, or other protected characteristics?
17. Have you tested the model for fairness across demographic groups?
18. What fairness metrics are tracked (demographic parity, equal opportunity, equalized odds)?
19. Are there known disparate impacts or performance differences across groups?
20. Is there a process for individuals to challenge AI decisions?

### A.5 Privacy and Data Protection

21. What personal data does the AI process in production?
22. What is the legal basis for processing (consent, contract, legitimate interest, legal obligation)?
23. Have you completed a Data Privacy Impact Assessment (DPIA)?
24. Where is data stored and processed (on-premise, cloud, geographic region)?
25. Can data subjects exercise their rights (access, deletion, portability, objection)?
26. Does the AI vendor train on customer data? Can you opt out?

### A.6 Security

27. What security controls protect the AI model and data? (encryption, access controls, authentication)
28. Has the system been tested for adversarial inputs?
29. Has penetration testing been performed?
30. Are there known vulnerabilities in the AI platform or dependencies?
31. How is the AI model protected from theft or extraction?

### A.7 Safety and Reliability

32. What happens if the AI system fails or produces incorrect outputs?
33. Have you tested the model on edge cases and failure modes?
34. What is the model's accuracy on test data? On production data?
35. Are there fail-safe mechanisms or human override capabilities?
36. How do you detect when model performance degrades?

### A.8 Transparency and Explainability

37. Can you explain how the AI reaches its decisions?
38. Are explanation mechanisms available for individual predictions?
39. Is there documentation of the model design, training, and limitations?
40. Do users understand they are interacting with AI?
41. Are there regulatory requirements for explainability (GDPR Article 22, fair lending)?

### A.9 Compliance and Legal

42. What regulations apply to this AI system? (GDPR, AI Act, sector-specific)
43. Have you conducted required assessments (DPIA, fundamental rights impact assessment)?
44. Are there intellectual property concerns with training data or model outputs?
45. Do contractual terms restrict AI usage or data processing?
46. Have legal counsel and compliance reviewed the use case?

### A.10 Ethical and Reputational

47. Does the AI use case align with organizational values?
48. Could the use case be perceived as surveillance, manipulation, or scoring?
49. Have you consulted affected stakeholders (employees, customers, advocacy groups)?
50. Is there a communication plan for AI usage transparency?

## Appendix B: Example Risk Scenarios

### Example 1: Bias Risk - Resume Screening AI

**AI System**: Automated resume screening for software engineering positions

**Risk Description**: AI model trained on historical hiring data systematically disadvantages female candidates due to male-dominated historical hiring patterns.

**Risk Category**: Bias and Fairness

**Inherent Likelihood**: Likely (4) - Historical data reflects known gender imbalance in tech hiring
**Inherent Impact**: Major (4) - Violation of employment discrimination laws, reputational harm
**Inherent Risk Score**: 16 (High)

**Existing Controls**:
- Removed explicit gender indicators (name, pronouns) from training data

**Residual Likelihood**: Possible (3) - Model may still learn gender proxies (school attended, extracurriculars)
**Residual Impact**: Major (4) - Legal and reputational impact unchanged
**Residual Risk Score**: 12 (High) - Exceeds tolerance

**Planned Controls**:
- Fairness testing for disparate impact across gender
- Augment training data with diverse resumes
- Human review of all AI recommendations before rejection
- Regular audit of hiring outcomes vs. candidate pool demographics

**Target Residual Risk**: 6 (Medium) - Acceptable with executive approval

### Example 2: Privacy Risk - Customer Service Chatbot

**AI System**: LLM-powered chatbot for customer support

**Risk Description**: Chatbot inadvertently includes PII from previous conversations in responses to other customers (privacy leakage).

**Risk Category**: Privacy and Data Protection

**Inherent Likelihood**: Unlikely (2) - Vendor claims separation of customer contexts
**Inherent Impact**: Severe (5) - GDPR violation, customer data breach, regulatory fines
**Inherent Risk Score**: 10 (Medium)

**Existing Controls**:
- Enterprise agreement with vendor (not public/free tool)
- Vendor provides data isolation guarantees
- No PII input into chatbot (policy requirement)

**Residual Likelihood**: Rare (1) - Controls reduce likelihood significantly
**Residual Impact**: Severe (5) - Impact unchanged if occurs
**Residual Risk Score**: 5 (Low) - Within tolerance

**Monitoring**: Track chatbot responses for PII leakage; conduct quarterly spot checks; require users to report any privacy issues immediately.

---

**Document History**

| Version | Date | Changes | Approved By |
|---------|------|---------|-------------|
| 1.0 | {{EFFECTIVE_DATE}} | Initial framework release | {{APPROVER}} |
