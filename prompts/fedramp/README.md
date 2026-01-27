# FedRAMP Prompts

## About FedRAMP

The Federal Risk and Authorization Management Program (FedRAMP) is a U.S. government-wide program that provides a standardized approach to security assessment, authorization, and continuous monitoring for cloud products and services. FedRAMP is based on NIST Special Publication 800-53 and establishes security controls for cloud service providers (CSPs) at three impact levels:

- **Low Impact:** Systems with minimal risk to agency operations, assets, or individuals
- **Moderate Impact:** Systems with moderate risk (most common baseline)
- **High Impact:** Systems with severe or catastrophic risk requiring the highest security controls

## Authorization Process

FedRAMP authorization follows a structured path:

1. **FedRAMP Ready:** CSP demonstrates capability to meet FedRAMP requirements
2. **In Process:** CSP is actively working toward authorization with an Agency or the Joint Authorization Board (JAB)
3. **Authorized:** CSP has achieved FedRAMP authorization and can be used by federal agencies

### Authorization Paths

**Agency Authorization:**
- Faster path (6-12 months typical)
- Sponsored by a specific federal agency
- Authorization applies to that agency's use, but can be leveraged by other agencies

**JAB Authorization:**
- Longer path (12-18+ months typical)
- Authorized by Joint Authorization Board (DoD, DHS, GSA)
- More portable across all federal agencies
- Preferred for cloud services with broad federal use

## Available Prompts

- **[compliance-assessment.md](./compliance-assessment.md)** - Assess FedRAMP authorization readiness and identify control gaps

## Prerequisites

Before using these prompts:
- Understand NIST 800-53 control families and baselines
- Have documentation about your cloud service architecture
- Know your target impact level (Low, Moderate, or High)
- Have current System Security Plan (SSP) or security documentation

## Resources

- [FedRAMP.gov](https://www.fedramp.gov/) - Official FedRAMP program website
- [FedRAMP Marketplace](https://marketplace.fedramp.gov/) - Authorized cloud services
- [NIST 800-53 Controls](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final) - Underlying control framework
- [FedRAMP Security Controls](https://www.fedramp.gov/documents/) - FedRAMP-specific control baselines
