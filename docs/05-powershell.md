# PowerShell Automation

## Objective
Use PowerShell to automate common Active Directory administration tasks, including bulk user provisioning, account management, and user auditing.

## Environment
| Component | Details |
|---|---|
| Domain Controller | DC1 |
| OS | Windows Server 2022 |
| Domain | corp.local |
| Script Location | C:\Scripts |
| Repository Folder | powershell/ |
| Tools | PowerShell, Active Directory Module, VS Code |

## Steps

### 1. Bulk User Provisioning
- Created a CSV file containing fictional employee information
- Wrote a PowerShell script to automate Active Directory user creation
- Used Import-Csv and a foreach loop to process multiple accounts
- Used Read-Host with SecureString to prompt for a temporary password instead of hardcoding it
- Automatically enabled accounts and assigned users to their security groups
- Required users to change their passwords at first login
- Added duplicate account checks and error handling

### 2. Account Configuration and Verification
- Ran the provisioning script on DC1
- Verified new accounts were created in the correct OU
- Confirmed security group memberships using PowerShell
- Used Set-ADUser to update department information for existing accounts
- Verified account information using Get-ADUser

### 3. Account Management Automation
- Created an interactive PowerShell script to manage Active Directory accounts
- Used a while loop to keep the menu running until the user exits
- Added options to disable, enable, unlock, and view account information
- Added an option to switch between users without restarting the script
- Added Y/N confirmations for account changes
- Used Get-ADUser to display updated account information
- Added error handling and tested the script using multiple domain accounts

### 4. Active Directory User Auditing
- Updated the existing PowerShell audit script to collect domain user information
- Used Get-ADUser to retrieve usernames, departments, account status, and password information
- Used Get-ADPrincipalGroupMembership to retrieve security group memberships
- Created a custom PowerShell object to organize account information
- Used Export-Csv to generate a user audit report
- Verified the exported CSV contained all five test accounts
- Practiced filtering account information using Where-Object

## Scripts
| Script | Purpose |
|---|---|
| create-ad-users.ps1 | Creates AD users from a CSV and assigns security groups |
| manage-ad-accounts.ps1 | Interactive tool for enabling, disabling, and unlocking accounts |
| audit-ad-users.ps1 | Collects account information and exports a CSV audit report |
| new-users.csv | Contains fictional employee information for bulk provisioning |
