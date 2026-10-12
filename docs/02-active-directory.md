# Active Directory Setup

## Objective
Configure Active Directory Domain Services (AD DS) on DC1 to manage domain users, computers, and security groups in the enterprise lab.

## Environment
| Component | Details |
|---|---|
| Domain Controller | DC1 |
| OS | Windows Server 2022 Standard Evaluation |
| Domain | corp.local |
| IP Address | 192.168.1.251 |
| DNS | 127.0.0.1 |
| AD DS | Installed |

## Steps

### 1. AD DS Installation
- Installed the Active Directory Domain Services role through Server Manager
- Promoted DC1 to a domain controller
- Created a new forest named corp.local
- Restarted DC1 after promotion

### 2. DNS Configuration
- Confirmed DNS was installed with AD DS
- Configured DC1 to use 127.0.0.1 for DNS
- Verified the domain was resolving correctly

### 3. Organizational Unit Structure
- Opened Active Directory Users and Computers
- Created a parent OU named Corp
- Created five child OUs: Users, Computers, Servers, Groups, and Service Accounts
- Enabled accidental deletion protection for the OUs
- Verified the OU structure in Active Directory Users and Computers
