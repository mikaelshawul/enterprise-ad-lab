# Enterprise Active Directory Lab

A hands-on Windows Server and Active Directory homelab built using KVM/QEMU on UnRAID. This project simulates a small enterprise Windows environment to practice systems administration, Group Policy, user management, PowerShell automation, and troubleshooting.

## Environment

| Component | Details |
|---|---|
| Hypervisor | KVM/QEMU via UnRAID |
| Domain Controller | DC1 - Windows Server 2022 |
| Workstation | PC1 - Windows 11 Pro |
| Domain | corp.local |
| Networking | Bridged LAN (br0) |
| Administration | RDP, PowerShell, Active Directory Users and Computers, Group Policy Management |

## Lab Documentation

| Section | Description |
|---|---|
| [01 - UnRAID VM Setup](docs/01-unraid-vm-setup.md) | Deployed and configured Windows Server 2022 as a virtual machine |
| [02 - Active Directory](docs/02-active-directory.md) | Configured AD DS, DNS, organizational units, users, and security groups |
| [03 - Domain Join](docs/03-domain-join.md) | Joined Windows 11 Pro to the domain and configured workstation access |
| [04 - Group Policy](docs/04-group-policy.md) | Configured security policies, password and account lockout settings, and group-based RDP access |
| [05 - PowerShell Automation](docs/05-powershell.md) | Automated user provisioning, account management, and auditing |

## PowerShell Scripts

| Script | Description |
|---|---|
| [create-ad-users.ps1](powershell/create-ad-users.ps1) | Creates AD users from a CSV file, assigns security groups, and configures temporary passwords |
| [manage-ad-accounts.ps1](powershell/manage-ad-accounts.ps1) | Interactive tool for enabling, disabling, unlocking, and reviewing domain accounts |
| [audit-ad-users.ps1](powershell/audit-ad-users.ps1) | Collects user information and exports an Active Directory audit report |
| [new-users.csv](powershell/new-users.csv) | Sample employee data used for bulk user provisioning |

## Key Skills Practiced

- Windows Server 2022 installation and administration
- Active Directory Domain Services (AD DS) and DNS
- Organizational unit, user, and security group management
- Windows 11 domain joining and Remote Desktop
- Group Policy creation, configuration, and troubleshooting
- Role-based access control and least privilege
- PowerShell scripting and Active Directory automation
- Virtualization using UnRAID and KVM/QEMU

## Troubleshooting

During the lab, PC1 stopped applying computer Group Policy settings due to a broken domain secure channel.

- Verified domain connectivity and access to SYSVOL
- Identified the broken trust using `Test-ComputerSecureChannel`
- Repaired the secure channel using PowerShell and domain administrator credentials
- Confirmed the workstation successfully applied Group Policy afterward

Additional configuration and troubleshooting details are included in the individual lab documents.

## Project Purpose

This lab was created to develop practical Windows administration and scripting skills beyond classroom learning. It provides hands-on experience with technologies commonly used in enterprise IT support, systems administration, and infrastructure environments.