# FISMA Prompts

## About FISMA

The Federal Information Security Modernization Act (FISMA) is a United States federal law enacted in 2014 that requires federal agencies and their contractors to develop, document, and implement information security and privacy programs. FISMA applies to all federal information systems, including those operated by contractors on behalf of federal agencies.

### Scope and Applicability

- **Federal Agencies:** All executive branch agencies must comply with FISMA
- **Contractors:** Organizations handling federal data or operating systems on behalf of agencies
- **State and Local:** Systems that connect to or process federal information

## Relationship to NIST 800-53 and RMF

FISMA compliance is achieved through the NIST Risk Management Framework (RMF), which uses NIST Special Publication 800-53 security controls. The RMF provides a structured process for integrating security and risk management into the system development lifecycle.

### NIST Risk Management Framework (RMF)

The RMF consists of six steps that organizations follow to achieve and maintain FISMA compliance:

1. **Categorize:** Categorize the system and information according to risk level (FIPS 199)
2. **Select:** Select appropriate security controls from NIST 800-53 based on categorization
3. **Implement:** Implement the selected security controls
4. **Assess:** Assess control effectiveness through testing and evaluation
5. **Authorize:** Senior official authorizes system operation based on risk
6. **Monitor:** Continuously monitor controls and system for changes

## Available Prompts

- **[control-evaluation.md](./control-evaluation.md)** - Evaluate FISMA control implementation status using NIST 800-53 controls

## Prerequisites

Before using these prompts:
- Know your system's FIPS 199 categorization (Low, Moderate, or High for Confidentiality, Integrity, Availability)
- Have System Security Plan (SSP) or security documentation available
- Understand which NIST 800-53 controls apply to your system
- Know the system authorization boundary and interconnections

## Resources

- [NIST Risk Management Framework](https://csrc.nist.gov/Projects/risk-management) - Official RMF guidance
- [NIST SP 800-53 Rev 5](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final) - Security and Privacy Controls
- [NIST SP 800-53A Rev 5](https://csrc.nist.gov/publications/detail/sp/800-53a/rev-5/final) - Assessment Procedures
- [NIST SP 800-37 Rev 2](https://csrc.nist.gov/publications/detail/sp/800-37/rev-2/final) - RMF for Information Systems
- [FIPS 199](https://csrc.nist.gov/publications/detail/fips/199/final) - Standards for Security Categorization
