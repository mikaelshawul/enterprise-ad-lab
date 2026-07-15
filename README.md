# Enterprise Hybrid AD Lab

A professional Microsoft enterprise administration lab built on KVM/QEMU via UnRAID, documenting the full lifecycle of a hybrid identity environment.

## Environment

| Component | Details |
|---|---|
| Hypervisor | KVM/QEMU via UnRAID |
| Domain Controller | Windows Server 2022 |
| Clients | Windows 11 Pro (x2)|
| Cloud Identity | Microsoft Entra ID |
| MDM | Microsoft Intune |
| Admin Portal | Microsoft 365 Admin Center |

## Lab Phases

| Phase | Topic | Status |
|---|---|---|
| 1 | Active Directory & PowerShell | 🔄 In Progress |
| 2 | Microsoft Entra ID | ⏳ Pending |
| 3 | Microsoft Intune | ⏳ Pending |
| 4 | Microsoft 365 Admin Center | ⏳ Pending |

## Repository Structure

enterprise-ad-lab/
├── docs/          # Step-by-step lab documentation
├── powershell/    # Scripts and automation
├── screenshots/   # Lab screenshots referenced in docs
├── diagrams/      # Network and architecture diagrams
└── notes/         # Rough notes and troubleshooting

## Goals

- Build a functional hybrid Active Directory environment
- Integrate on-premises AD with Microsoft Entra ID
- Manage devices via Microsoft Intune
- Develop practical PowerShell automation skills
- Produce professional documentation suitable for a portfolio