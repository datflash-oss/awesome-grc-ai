---
title: "Model Development Lifecycle Standard"
type: "Standard"
version: "1.0"
framework_alignment:
  - "NIST AI RMF 1.0"
  - "ISO/IEC 42001:2023"
  - "MLOps Best Practices"
last_updated: "2026-01-27"
author: "Community"
complexity: "Advanced"
estimated_customization_time: "3-5 hours"
variables:
  - name: "ORGANIZATION_NAME"
    description: "Legal name of your organization"
    required: true
    example: "Acme Corporation"
  - name: "EFFECTIVE_DATE"
    description: "Date when standard becomes effective"
    required: true
    example: "2026-03-01"
  - name: "CLASSIFICATION"
    description: "Document classification level"
    required: true
    example: "Internal"
  - name: "STANDARD_OWNER"
    description: "Name and title of standard owner"
    required: true
    example: "Jane Smith, Chief Data Officer"
  - name: "APPROVER"
    description: "Name and title of approving authority"
    required: true
    example: "John Doe, Chief Technology Officer"
  - name: "ML_PLATFORM"
    description: "MLOps platform or tools used"
    required: false
    example: "MLflow"
  - name: "MODEL_REGISTRY"
    description: "Where models are registered and versioned"
    required: false
    example: "MLflow Model Registry"
  - name: "DOCUMENTATION_SYSTEM"
    description: "Where model documentation is stored"
    required: false
    example: "Confluence"
  - name: "MONITORING_PLATFORM"
    description: "Platform for production model monitoring"
    required: false
    example: "Datadog"
  - name: "APPROVAL_WORKFLOW_TOOL"
    description: "System for approval workflows"
    required: false
    example: "Jira"
---

# Model Development Lifecycle Standard

## Document Control

| Attribute | Value |
|-----------|-------|
| **Organization** | {{ORGANIZATION_NAME}} |
| **Effective Date** | {{EFFECTIVE_DATE}} |
| **Version** | 1.0 |
| **Classification** | {{CLASSIFICATION}} |
| **Standard Owner** | {{STANDARD_OWNER}} |
| **Approved By** | {{APPROVER}} |
| **Last Updated** | 2026-01-27 |

## 1. Purpose and Scope

### 1.1 Purpose

This standard establishes governance requirements for developing, deploying, and maintaining machine learning (ML) models at {{ORGANIZATION_NAME}}.

The standard ensures:
- Consistent approach to ML model development across teams
- Risk management and compliance throughout the model lifecycle
- Quality assurance and validation before production deployment
- Ongoing monitoring and maintenance of deployed models
- Accountability and auditability of model decisions
- Alignment with AI governance frameworks (NIST AI RMF, ISO 42001)

**This is a governance standard**, not a technical implementation guide. It defines **what** governance checkpoints are required and **when** they occur, not **how** to implement ML algorithms or infrastructure (see {{ML_PLATFORM}} documentation for technical implementation).

### 1.2 Scope

This standard applies to:

**Models in Scope**:
- Supervised learning models (classification, regression)
- Unsupervised learning models (clustering, dimensionality reduction)
- Deep learning models (neural networks, LLMs)
- Reinforcement learning models
- Ensemble models and AutoML systems
- Models developed internally or procured from vendors (with adaptations for vendor models)

**Out of Scope**:
- Simple rule-based systems or heuristics (no machine learning)
- One-time exploratory analyses (not deployed to production)
- Academic research models (not used for operational decisions)

**Lifecycle Coverage**:
All stages from initial problem scoping through production deployment and eventual retirement.

### 1.3 Framework Alignment

**NIST AI RMF 1.0**:
- **GOVERN**: Establishes governance structure and policies across lifecycle
- **MAP**: Problem definition and data context (Stages 1-2)
- **MEASURE**: Model validation and testing (Stages 3-4)
- **MANAGE**: Deployment, monitoring, and maintenance (Stages 5-7)

**ISO/IEC 42001:2023**:
- Clause 8.2: AI system development and acquisition
- Clause 8.3: AI system deployment
- Clause 8.4: AI system operation
- Clause 8.5: AI system monitoring and continual improvement

**MLOps Best Practices**:
- Versioning and reproducibility
- Continuous integration / continuous deployment (CI/CD)
- Automated testing and validation
- Production monitoring and alerting

## 2. Lifecycle Stages Overview

The Model Development Lifecycle consists of 7 stages with defined governance checkpoints:

| Stage | Purpose | Key Deliverables | Governance Gate |
|-------|---------|------------------|-----------------|
| **1. Problem Definition & Scoping** | Define business problem, success criteria, ethical considerations | Business case, ethical review, stakeholder sign-off | Gate 1: Approval to Proceed |
| **2. Data Acquisition & Preparation** | Acquire, clean, and prepare training data | Data governance review, privacy assessment, dataset documentation | Gate 2: Data Approval |
| **3. Model Development** | Design, train, and tune model | Algorithm justification, model card, fairness testing | Gate 3: Model Review |
| **4. Validation & Testing** | Validate performance, fairness, security, and robustness | Validation report, test results, risk assessment | Gate 4: Deployment Approval |
| **5. Deployment** | Deploy to production with monitoring and controls | Deployment plan, runbook, rollback procedure | Gate 5: Production Sign-off |
| **6. Monitoring & Maintenance** | Monitor performance, detect drift, retrain as needed | Monitoring dashboard, drift alerts, incident reports | Periodic review (quarterly) |
| **7. Retirement** | Decommission model when no longer needed | Retirement plan, data retention, documentation archive | Gate 6: Retirement Approval |

**Iterative Process**: Models may iterate through Stages 2-4 multiple times during development. Governance gates apply to each iteration affecting production.

**Risk-Based Application**: High-risk models require enhanced reviews; low-risk models may have expedited gates. See Section 11 for risk-based requirements.

## 3. Stage 1: Problem Definition and Scoping

### 3.1 Stage Purpose

Clearly define the business problem, assess feasibility, and establish success criteria before investing in model development.

### 3.2 Key Activities

1. **Business Case Development**:
   - Define business problem and objectives
   - Identify stakeholders and affected populations
   - Estimate ROI and resource requirements
   - Assess alternatives to ML (rule-based systems, human processes)

2. **Feasibility Assessment**:
   - Confirm data availability and quality
   - Evaluate technical feasibility
   - Identify skill and resource gaps
   - Assess timeline and dependencies

3. **Ethical Review**:
   - Identify potential ethical concerns (bias, privacy, manipulation)
   - Assess impact on vulnerable populations
   - Consider unintended consequences
   - Evaluate alignment with organizational values

4. **Success Criteria Definition**:
   - Define measurable success metrics (accuracy, precision, recall, F1, AUC)
   - Establish fairness criteria across demographic groups
   - Set acceptable performance thresholds
   - Define business impact metrics (cost savings, revenue, customer satisfaction)

### 3.3 Required Documentation

- **Business Case Document**: Problem statement, objectives, ROI, alternatives considered
- **Ethical Review Checklist**: Potential harms, affected populations, mitigation strategies
- **Success Criteria**: Performance metrics, fairness metrics, business KPIs with thresholds

### 3.4 Governance Gate 1: Approval to Proceed

**Approval Required From**:
- Business Sponsor (confirms business value)
- {{STANDARD_OWNER}} or Data Science Lead (confirms feasibility)
- Ethics Reviewer (confirms ethical considerations addressed)
- For high-risk models: AI Governance Committee

**Approval Criteria**:
- Clear business case with measurable value
- Data availability confirmed
- Ethical concerns identified and addressable
- Success criteria defined and realistic
- Resources and timeline approved

**Documentation**: Record approval in {{APPROVAL_WORKFLOW_TOOL}} with approver names and dates.

## 4. Stage 2: Data Acquisition and Preparation

### 4.1 Stage Purpose

Acquire, clean, prepare, and document training data while ensuring data quality, privacy, and compliance.

### 4.2 Key Activities

1. **Data Acquisition**:
   - Identify data sources (internal databases, third-party data, public datasets)
   - Verify data access permissions and legal rights
   - Assess data licensing restrictions
   - Document data lineage (origin, collection methods, timestamps)

2. **Data Governance Review**:
   - Classify data according to Data Classification Policy
   - Verify compliance with data usage policies
   - Check data sharing agreements for ML restrictions
   - Obtain necessary approvals for data usage

3. **Privacy Assessment**:
   - Identify PII, PHI, or sensitive personal data
   - Complete Data Privacy Impact Assessment (DPIA) if required
   - Apply data minimization (use only necessary features)
   - Implement anonymization or pseudonymization where feasible
   - Document legal basis for processing (GDPR Article 6)

4. **Bias Assessment**:
   - Analyze training data demographics and representativeness
   - Identify underrepresented groups or missing data
   - Check for historical bias or discriminatory patterns
   - Document known data limitations and biases

5. **Data Preparation**:
   - Clean data (handle missing values, outliers, duplicates)
   - Feature engineering and transformation
   - Split into training, validation, and test sets
   - Document all preprocessing steps for reproducibility

### 4.3 Required Documentation

- **Dataset Card** (following Datasheets for Datasets format):
  - Motivation: Why was the dataset created?
  - Composition: What is in the dataset? Demographics?
  - Collection: How was data collected? By whom? When?
  - Preprocessing: What preprocessing was applied?
  - Uses: What should the dataset be used for? What should it NOT be used for?
  - Distribution: How is dataset maintained? Who has access?
  - Maintenance: Who maintains the dataset? How often is it updated?

- **Privacy Impact Assessment** (if PII/PHI involved)
- **Bias Assessment Report**: Known biases, underrepresented groups, mitigation strategies

### 4.4 Governance Gate 2: Data Approval

**Approval Required From**:
- Data Governance Team (confirms data usage compliance)
- Privacy Team (confirms privacy requirements met)
- For sensitive data: Legal and Compliance

**Approval Criteria**:
- Data sourced and used in compliance with policies
- Privacy requirements met (DPIA completed if needed)
- Data quality sufficient for intended use
- Known biases identified and documented
- Dataset card completed

**Documentation**: Record approval in {{APPROVAL_WORKFLOW_TOOL}}; store dataset card in {{DOCUMENTATION_SYSTEM}}.

## 5. Stage 3: Model Development

### 5.1 Stage Purpose

Design, train, and tune the ML model while documenting design decisions and testing for fairness.

### 5.2 Key Activities

1. **Algorithm Selection**:
   - Evaluate candidate algorithms (linear models, tree-based, neural networks)
   - Justify algorithm selection based on:
     - Problem type (classification, regression, clustering)
     - Interpretability requirements
     - Performance requirements
     - Computational constraints
   - Document tradeoffs (e.g., accuracy vs. interpretability)

2. **Model Training**:
   - Train model on training set
   - Tune hyperparameters using validation set
   - Implement cross-validation to avoid overfitting
   - Track experiments and results in {{ML_PLATFORM}}

3. **Fairness Testing**:
   - Test model for disparate impact across demographic groups
   - Calculate fairness metrics:
     - Demographic Parity (equal positive prediction rate)
     - Equal Opportunity (equal true positive rate)
     - Equalized Odds (equal TPR and FPR)
     - Predictive Parity (equal precision)
   - Apply bias mitigation techniques if needed (reweighting, adversarial debiasing, post-processing)

4. **Interpretability and Explainability**:
   - For high-stakes decisions: Implement explanation mechanism (LIME, SHAP, attention mechanisms)
   - Analyze feature importance
   - Validate that model logic aligns with domain knowledge
   - Test explanations with domain experts

5. **Version Control**:
   - Commit code to version control (Git)
   - Version training data snapshots
   - Register model in {{MODEL_REGISTRY}} with version tag
   - Link model version to code commit and data version

### 5.3 Required Documentation

- **Model Card** (following Model Cards for Model Reporting format):
  - Model Details: Architecture, training algorithm, version, date
  - Intended Use: Primary uses, out-of-scope uses, users
  - Factors: Relevant demographic groups, instrumentation, environment
  - Metrics: Performance metrics, decision thresholds
  - Evaluation Data: Test dataset characteristics, splits
  - Training Data: See dataset card reference
  - Quantitative Analyses: Performance across demographic groups
  - Ethical Considerations: Known limitations, potential harms
  - Caveats and Recommendations: Usage guidelines, monitoring needs

- **Algorithm Justification**: Why this algorithm was selected over alternatives
- **Fairness Testing Report**: Metrics across demographic groups, mitigation applied

### 5.4 Governance Gate 3: Model Review

**Approval Required From**:
- Data Science Lead (confirms technical soundness)
- Business Stakeholder (confirms model aligns with use case)
- For high-risk models: Ethics Reviewer, Security Team

**Approval Criteria**:
- Algorithm selection justified
- Fairness tested across relevant demographic groups
- Model card completed with all sections
- Explainability mechanism implemented (if required for use case)
- Model versioned and registered

**Documentation**: Record approval in {{APPROVAL_WORKFLOW_TOOL}}; store model card in {{DOCUMENTATION_SYSTEM}}.

## 6. Stage 4: Validation and Testing

### 6.1 Stage Purpose

Rigorously validate model performance, fairness, security, and robustness before production deployment.

### 6.2 Key Activities

1. **Performance Validation**:
   - Evaluate on held-out test set (never used in training or tuning)
   - Calculate performance metrics: accuracy, precision, recall, F1, AUC-ROC
   - Compare to baseline model and success criteria
   - Validate performance on edge cases and rare scenarios
   - Test with out-of-distribution data (if available)

2. **Fairness Validation**:
   - Re-test fairness metrics on test set
   - Confirm no disparate impact across protected groups
   - Validate that bias mitigation did not degrade overall performance unacceptably
   - Document any remaining performance disparities

3. **Robustness Testing**:
   - Test with noisy or corrupted inputs
   - Evaluate sensitivity to input perturbations
   - Test failure modes and error handling
   - Validate confidence calibration (predicted probabilities match true frequencies)

4. **Security Testing**:
   - Test for adversarial inputs (FGSM, PGD attacks)
   - Validate input sanitization and validation
   - Check for data leakage (model revealing training data)
   - For LLMs: Test prompt injection and jailbreak attempts

5. **User Acceptance Testing (UAT)**:
   - Validate with end users in realistic scenarios
   - Collect user feedback on outputs and explanations
   - Confirm outputs are interpretable and actionable
   - Identify any usability issues or confusion

6. **Risk Assessment**:
   - Complete AI Risk Assessment (see AI Risk Assessment Framework)
   - Identify residual risks after all mitigations
   - Document risk acceptance with approvals

### 6.3 Required Documentation

- **Validation Report**:
  - Performance metrics on test set
  - Fairness metrics across demographic groups
  - Robustness and security testing results
  - UAT findings and feedback
  - Comparison to success criteria and baseline
  - Known limitations and failure modes

- **AI Risk Assessment** (per AI Risk Assessment Framework)
- **Test Plan and Results**: Test cases, pass/fail criteria, actual results

### 6.4 Governance Gate 4: Deployment Approval

**Approval Required From**:
- Data Science Lead (confirms validation complete and successful)
- Business Sponsor (confirms model meets business requirements)
- Information Security (confirms security testing passed)
- For high-risk models: AI Governance Committee, Legal/Compliance

**Approval Criteria**:
- Performance meets or exceeds success criteria
- Fairness metrics within acceptable thresholds
- Security and robustness testing passed
- Risk assessment completed; residual risk accepted
- UAT completed with satisfactory results
- All documentation complete

**Deployment Authorization**: Formal sign-off required before production deployment.

**Documentation**: Record approval in {{APPROVAL_WORKFLOW_TOOL}} with all approver sign-offs.

## 7. Stage 5: Deployment

### 7.1 Stage Purpose

Deploy model to production with appropriate monitoring, controls, and rollback capabilities.

### 7.2 Key Activities

1. **Deployment Planning**:
   - Define deployment architecture (batch, real-time API, edge)
   - Plan rollout strategy (canary, blue-green, phased rollout)
   - Establish monitoring and alerting thresholds
   - Prepare rollback plan

2. **Infrastructure Preparation**:
   - Provision production infrastructure (compute, storage, networking)
   - Configure access controls and authentication
   - Set up logging and audit trails
   - Implement rate limiting and throttling (if API)

3. **Monitoring Setup**:
   - Configure performance monitoring in {{MONITORING_PLATFORM}}
   - Set up drift detection (data drift, concept drift)
   - Implement alerting for:
     - Performance degradation (accuracy drop)
     - Fairness metric violations
     - High error rates or failure modes
     - Unusual input patterns (potential adversarial attacks)
     - Latency or availability issues

4. **Human-in-the-Loop Controls** (for high-stakes decisions):
   - Implement human review workflows for edge cases or low-confidence predictions
   - Define confidence thresholds for automated vs. human-reviewed decisions
   - Set up escalation procedures for challenging cases

5. **Deployment Execution**:
   - Deploy model to production environment
   - Conduct smoke tests (basic functionality check)
   - Monitor initial production traffic closely
   - Gradually increase traffic (if canary/phased rollout)

6. **Operational Handoff**:
   - Train operations team on model monitoring and incident response
   - Provide runbook with troubleshooting steps
   - Document escalation procedures
   - Establish on-call rotation (if 24/7 system)

### 7.3 Required Documentation

- **Deployment Plan**: Architecture, rollout strategy, timeline
- **Runbook**: Operational procedures, troubleshooting, escalation
- **Rollback Procedure**: Steps to revert to previous model version
- **Monitoring Dashboard**: Link to production monitoring dashboard
- **Incident Response Plan**: How to respond to model failures or issues

### 7.4 Governance Gate 5: Production Sign-off

**Approval Required From**:
- Operations Lead (confirms infrastructure ready and team trained)
- Data Science Lead (confirms model deployed correctly and monitoring active)
- Business Sponsor (confirms readiness for production use)

**Approval Criteria**:
- Model deployed to production successfully
- Monitoring and alerting configured and tested
- Runbook and rollback procedures documented
- Operations team trained
- Initial smoke tests passed

**Post-Deployment Review**: Within 30 days of deployment, review actual performance vs. expected performance and document lessons learned.

**Documentation**: Record sign-off in {{APPROVAL_WORKFLOW_TOOL}}; store runbook in {{DOCUMENTATION_SYSTEM}}.

## 8. Stage 6: Monitoring and Maintenance

### 8.1 Stage Purpose

Continuously monitor production model performance, detect issues, and maintain model effectiveness over time.

### 8.2 Key Activities

1. **Performance Monitoring**:
   - Track key metrics daily: accuracy, precision, recall, latency
   - Compare production performance to test set performance
   - Monitor for performance degradation over time
   - Generate weekly/monthly performance reports

2. **Drift Detection**:
   - **Data Drift**: Detect changes in input feature distributions
     - Use statistical tests (KS test, Chi-square test)
     - Alert when distributions diverge significantly
   - **Concept Drift**: Detect changes in relationship between features and outcome
     - Monitor if same inputs yield different outcomes over time
     - Track ground truth labels (when available) vs. predictions
   - **Prediction Drift**: Monitor changes in model output distribution

3. **Fairness Monitoring**:
   - Track fairness metrics across demographic groups (if data available)
   - Alert on fairness violations or emerging disparities
   - Investigate root causes of fairness drift

4. **Incident Management**:
   - Monitor for errors, failures, and anomalies
   - Investigate incidents (false positives, false negatives, system failures)
   - Document incidents and root causes
   - Implement corrective actions

5. **Feedback Loops**:
   - Collect user feedback on model outputs
   - Track manual overrides of model decisions
   - Identify patterns in model failures or user dissatisfaction
   - Use feedback to improve model in next iteration

6. **Retraining Triggers**:
   - Define conditions triggering model retraining:
     - Performance degrades below threshold (e.g., 5% accuracy drop)
     - Significant data drift detected
     - New training data available (e.g., 6 months of new data accumulated)
     - Business requirements change
     - Security vulnerability discovered
   - When triggered: Return to Stage 2 (Data Acquisition) with updated data

### 8.3 Required Documentation

- **Monitoring Dashboard**: Real-time view of model performance (link to {{MONITORING_PLATFORM}})
- **Performance Reports**: Weekly/monthly summaries of key metrics
- **Incident Log**: Record of all model-related incidents with root cause analysis
- **Drift Analysis Reports**: When drift detected, document analysis and decision (retrain vs. accept)

### 8.4 Periodic Review

**Quarterly Review** (for high-risk models) or **Annual Review** (for medium/low-risk models):
- Review production performance trends
- Assess whether model still meets business needs
- Review incident history and lessons learned
- Validate that monitoring is adequate
- Check for regulatory or policy changes affecting model
- Decide: Continue as-is, retrain, enhance, or retire

**Review Participants**: Model Owner, Data Science Lead, Business Sponsor, Operations

**Documentation**: Record review meeting notes and decisions in {{DOCUMENTATION_SYSTEM}}.

## 9. Stage 7: Retirement

### 9.1 Stage Purpose

Safely decommission models that are no longer needed, outdated, or being replaced.

### 9.2 Retirement Triggers

Retire a model when:
- Model is superseded by a new version or alternative approach
- Business use case no longer exists
- Model performance is unacceptable and cannot be improved
- Regulatory changes make model non-compliant
- Security vulnerabilities cannot be adequately mitigated
- Cost of maintenance exceeds business value

### 9.3 Key Activities

1. **Retirement Planning**:
   - Notify stakeholders of planned retirement (users, operations, business)
   - Plan transition to replacement model or manual process
   - Define retirement timeline and milestones

2. **Production Decommissioning**:
   - Remove model from production environment
   - Disable API endpoints or batch jobs
   - Update dependent systems to stop calling retired model
   - Archive production logs and monitoring data

3. **Data Retention and Deletion**:
   - Follow Data Retention Policy for training data, test data, and production logs
   - Delete data when retention period expires
   - Document what was retained and what was deleted

4. **Documentation Archival**:
   - Archive all model documentation (model card, dataset card, validation reports)
   - Store in long-term archive for audit and compliance purposes
   - Retention period: Minimum 7 years (or per regulatory requirements)

5. **Lessons Learned**:
   - Document model lifecycle retrospective
   - What worked well? What could be improved?
   - Capture insights for future model development
   - Share learnings with data science team

### 9.4 Required Documentation

- **Retirement Plan**: Timeline, stakeholder communication, transition plan
- **Decommissioning Checklist**: Confirmation that all production systems updated
- **Data Retention Record**: What data was retained, what was deleted, retention periods
- **Archival Index**: Where documentation is archived and how to retrieve it
- **Lessons Learned Report**: Retrospective on model lifecycle

### 9.5 Governance Gate 6: Retirement Approval

**Approval Required From**:
- Model Owner (confirms retirement is appropriate)
- Business Sponsor (confirms no further business need)
- Data Science Lead (confirms proper archival and data handling)

**Approval Criteria**:
- Retirement justified (use case obsolete, model replaced, etc.)
- Stakeholders notified
- Transition to replacement completed (or manual process in place)
- Data retention requirements followed
- Documentation archived

**Documentation**: Record approval in {{APPROVAL_WORKFLOW_TOOL}}.

## 10. Governance Checkpoints Summary

### 10.1 Required Approvals by Stage

| Governance Gate | Stage | Approvers | Key Artifacts |
|----------------|-------|-----------|---------------|
| **Gate 1: Approval to Proceed** | Stage 1 | Business Sponsor, Data Science Lead, Ethics Reviewer | Business case, ethical review, success criteria |
| **Gate 2: Data Approval** | Stage 2 | Data Governance, Privacy Team | Dataset card, privacy assessment, bias assessment |
| **Gate 3: Model Review** | Stage 3 | Data Science Lead, Business Stakeholder | Model card, algorithm justification, fairness report |
| **Gate 4: Deployment Approval** | Stage 4 | Data Science Lead, Business Sponsor, InfoSec, [AI Governance Committee for high-risk] | Validation report, risk assessment, UAT results |
| **Gate 5: Production Sign-off** | Stage 5 | Operations Lead, Data Science Lead, Business Sponsor | Deployment plan, runbook, rollback procedure |
| **Gate 6: Retirement Approval** | Stage 7 | Model Owner, Business Sponsor, Data Science Lead | Retirement plan, data retention record, archival index |

### 10.2 Periodic Reviews

- **Post-Deployment Review**: Within 30 days of production deployment
- **Quarterly Review**: For high-risk models
- **Annual Review**: For medium/low-risk models
- **Ad-hoc Review**: When triggered by incidents, drift, or performance degradation

## 11. Roles and Responsibilities

| Role | Responsibilities |
|------|------------------|
| **Model Owner** | Accountable for model through entire lifecycle; initiates stages; ensures compliance with standard; owns model performance and risk |
| **Data Science Lead** | Technical oversight; approves technical decisions; ensures quality of model development and validation; reviews all models before deployment |
| **Business Sponsor** | Defines business requirements; approves business case; accepts model for production use; accountable for business outcomes |
| **Data Governance Team** | Reviews data sourcing and usage; ensures data compliance; approves data for model training |
| **Privacy Team** | Conducts privacy assessments; ensures GDPR/privacy law compliance; approves PII/PHI usage |
| **Information Security** | Conducts security reviews; tests for adversarial robustness; approves deployment from security perspective |
| **Ethics Reviewer** | Reviews ethical implications; identifies potential harms; ensures fairness testing completed |
| **Operations Team** | Deploys models to production; monitors production systems; responds to incidents; maintains infrastructure |
| **AI Governance Committee** | Reviews and approves high-risk models; provides oversight; escalates issues to executive leadership |
| **Internal Audit** | Audits compliance with this standard; reviews governance checkpoints; assesses control effectiveness |

## 12. Risk-Based Requirements

### 12.1 Risk Categorization

Models are categorized as Low, Medium, or High risk (see AI Risk Assessment Framework).

### 12.2 Differentiated Requirements

| Requirement | Low Risk | Medium Risk | High Risk |
|-------------|----------|-------------|-----------|
| **Ethical Review (Stage 1)** | Optional | Recommended | Required |
| **Privacy Assessment (Stage 2)** | If PII involved | Required if PII involved | Required; formal DPIA if PII involved |
| **Fairness Testing (Stage 3)** | Recommended | Required | Required + external review |
| **Explainability (Stage 3)** | Optional | Recommended | Required |
| **Security Testing (Stage 4)** | Basic | Standard | Enhanced + penetration testing |
| **AI Governance Committee Review** | Not required | For deployment approval | For all major gates |
| **Monitoring (Stage 6)** | Monthly | Weekly | Daily |
| **Periodic Review** | Annual | Annual | Quarterly |

### 12.3 Expedited Approval

For low-risk models, expedited approval process available:
- Gates 1-3 can be combined into single approval
- AI Governance Committee approval not required
- Reduced documentation requirements (essential sections only)

**Criteria for expedited approval**: Low risk score, no PII/PHI, advisory use only (human review of all outputs), non-customer-facing.

## 13. Documentation Requirements

### 13.1 Required Documentation by Stage

All documentation stored in {{DOCUMENTATION_SYSTEM}} with links from {{MODEL_REGISTRY}}.

| Stage | Required Documents | Template Location |
|-------|--------------------|-------------------|
| **Stage 1** | Business case, ethical review checklist, success criteria | {{DOCUMENTATION_SYSTEM}}/templates/stage1/ |
| **Stage 2** | Dataset card, privacy assessment, bias assessment | {{DOCUMENTATION_SYSTEM}}/templates/stage2/ |
| **Stage 3** | Model card, algorithm justification, fairness report | {{DOCUMENTATION_SYSTEM}}/templates/stage3/ |
| **Stage 4** | Validation report, risk assessment, test results | {{DOCUMENTATION_SYSTEM}}/templates/stage4/ |
| **Stage 5** | Deployment plan, runbook, rollback procedure | {{DOCUMENTATION_SYSTEM}}/templates/stage5/ |
| **Stage 6** | Monitoring dashboard, performance reports, incident log | {{MONITORING_PLATFORM}} + {{DOCUMENTATION_SYSTEM}} |
| **Stage 7** | Retirement plan, data retention record, lessons learned | {{DOCUMENTATION_SYSTEM}}/templates/stage7/ |

### 13.2 Documentation Standards

All documentation must:
- Use provided templates (or approved alternatives)
- Be version-controlled alongside model versions
- Include author, reviewers, approvers with dates
- Be accessible to auditors and compliance teams
- Be retained per retention policy (minimum 7 years for high-risk models)

## 14. Exceptions and Waivers

### 14.1 Exception Process

If compliance with any requirement is not feasible, request an exception:

1. **Submit Exception Request** to {{STANDARD_OWNER}}:
   - Requirement being waived
   - Justification (why compliance is not feasible)
   - Compensating controls (alternative mitigations)
   - Duration of exception

2. **Review and Approval**:
   - Low/Medium risk models: {{STANDARD_OWNER}} approval
   - High risk models: AI Governance Committee approval

3. **Documentation**: Record exception with justification and compensating controls

4. **Review**: Exceptions reviewed annually; re-justify or implement full compliance

### 14.2 Emergency Deployments

In exceptional circumstances (security incidents, system failures, regulatory deadlines), expedited deployment allowed:

- **Minimum requirements**: Stages 1, 2, 4 (problem definition, data approval, basic validation)
- **Post-deployment**: Complete remaining stages within 30 days
- **Approval**: AI Governance Committee chair or executive leadership
- **Documentation**: Emergency deployment justification and post-deployment compliance plan

## 15. Standard Maintenance

### 15.1 Review Cycle

This standard is reviewed **annually** or when triggered by:
- Regulatory changes affecting AI governance
- Major AI incident revealing gaps in standard
- Organizational changes (new roles, new tools)
- Industry best practice evolution

### 15.2 Update Process

1. {{STANDARD_OWNER}} proposes updates
2. Stakeholder review (Data Science, Legal, Security, Compliance, Operations)
3. AI Governance Committee approval
4. {{APPROVER}} final sign-off
5. Communication to all model owners and data science teams
6. Training on changes (if material)

## 16. Related Policies and Standards

This standard should be read in conjunction with:
- AI Acceptable Use Policy
- AI Risk Assessment Framework
- Data Governance Policy
- Data Classification Policy
- Privacy Policy
- Information Security Policy
- Data Retention Policy

## Contact Information

**Questions about this standard**:
- {{STANDARD_OWNER}}

**Model approval requests**:
- Submit via {{APPROVAL_WORKFLOW_TOOL}}

**Technical guidance (MLOps)**:
- See {{ML_PLATFORM}} documentation
- Data Science Team: datascience@{{ORGANIZATION_NAME}}.com

---

**Document History**

| Version | Date | Changes | Approved By |
|---------|------|---------|-------------|
| 1.0 | {{EFFECTIVE_DATE}} | Initial standard release | {{APPROVER}} |
