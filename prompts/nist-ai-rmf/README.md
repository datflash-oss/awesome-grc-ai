# NIST AI RMF Prompts

## About NIST AI RMF

The NIST Artificial Intelligence Risk Management Framework (AI RMF 1.0) is a voluntary framework released by the National Institute of Standards and Technology in January 2023. It provides a comprehensive approach for organizations to manage risks associated with artificial intelligence systems throughout their lifecycle.

The AI RMF is designed to be:
- **Voluntary:** Not a regulatory requirement, but a best practice framework
- **Risk-based:** Focuses on identifying and managing AI-specific risks
- **Sector-agnostic:** Applicable across industries and use cases
- **Lifecycle-oriented:** Covers design, development, deployment, and operation

## Four Core Functions

The NIST AI RMF is organized around four core functions that work together to manage AI risks:

### 1. GOVERN
Cultivates a culture of risk management and establishes accountability structures for AI systems.

**Key activities:**
- Establish AI governance structures and policies
- Define roles and responsibilities for AI risk management
- Ensure accountability and transparency
- Align AI objectives with organizational values and legal/regulatory requirements
- Build organizational culture that prioritizes trustworthy AI

### 2. MAP
Establishes context for understanding AI risks by identifying system characteristics, impacts, and potential harms.

**Key activities:**
- Identify system purpose, context, and stakeholders
- Map potential risks, impacts, and harms
- Understand data quality and provenance
- Identify interdependencies and system boundaries
- Document intended use and reasonably foreseeable misuse

### 3. MEASURE
Employs quantitative and qualitative metrics to assess AI risks and model performance.

**Key activities:**
- Define and track metrics for trustworthy AI characteristics (accuracy, fairness, robustness, privacy, security, transparency, explainability)
- Test and validate AI systems against metrics
- Monitor performance over time
- Assess impacts on individuals and groups
- Document measurement methodologies

### 4. MANAGE
Allocates resources to manage identified AI risks and implements appropriate treatments.

**Key activities:**
- Prioritize risks based on severity and likelihood
- Select and implement risk treatments (mitigate, accept, transfer, avoid)
- Establish incident response and monitoring processes
- Plan for system retirement or decommissioning
- Continuously improve based on feedback

## AI RMF 1.0 vs Generative AI Profile

**NIST AI RMF 1.0 (January 2023):**
- Foundational framework for all AI systems
- Broad applicability across AI types
- Focus on general AI risk categories

**NIST AI 600-1 Generative AI Profile (July 2024):**
- Companion resource specific to generative AI (large language models, image generators, etc.)
- Addresses unique risks: hallucinations, content provenance, prompt injection, harmful content generation
- Supplements AI RMF 1.0 with GenAI-specific guidance

Use the Generative AI Profile when your system involves LLMs, diffusion models, GANs, or other generative AI technologies.

## Available Prompts

- **[risk-assessment.md](./risk-assessment.md)** - Comprehensive AI risk assessment using the four NIST AI RMF functions

## Prerequisites

Before using these prompts:
- Understand the AI system being assessed (purpose, data, algorithms, deployment context)
- Know key stakeholders (developers, users, affected individuals)
- Have access to system documentation (model architecture, training data, performance metrics)
- Understand the system's intended use and potential impacts

## Resources

- [NIST AI RMF 1.0](https://www.nist.gov/itl/ai-risk-management-framework) - Official AI RMF framework (January 2023)
- [NIST AI 600-1 Generative AI Profile](https://airc.nist.gov/AI_RMF_Knowledge_Base/Generative_AI) - GenAI-specific guidance (July 2024)
- [AI RMF Playbook](https://airc.nist.gov/AI_RMF_Knowledge_Base/Playbook) - Implementation guidance
- [Trustworthy AI Characteristics](https://www.nist.gov/itl/ai-risk-management-framework/ai-rmf-development) - Valid and reliable, safe, secure and resilient, accountable and transparent, explainable and interpretable, privacy-enhanced, fair with harmful bias managed
