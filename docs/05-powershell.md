### 1. Bulk User Provisioning
- Created a CSV file with fictional employee information
- Wrote a PowerShell script to automate Active Directory user creation
- Used Import-Csv and a foreach loop to process multiple accounts
- Configured temporary lab passwords and required users to change them at first login
- Automatically enabled accounts and assigned users to their security groups
- Added error handling and duplicate account checks to avoid common provisioning issues

### 2. Account Verification
- Ran the provisioning script on DC1
- Verified new accounts were enabled and created in the correct OU
- Confirmed security group membership using PowerShell
- Tested the password change requirement during domain sign-in

### 3. Account Management Automation
- Created an interactive PowerShell script to manage Active Directory accounts
- Used a while loop to keep the management menu running until the user exits
- Added options to disable, enable, unlock, and view account information
- Added an option to switch between users without restarting the script
- Used Get-ADUser to display updated account information after changes
- Added error handling and confirmation before disabling accounts
- Tested the script using multiple domain accounts

### 4. Active Directory User Auditing
- Updated the existing PowerShell audit script to collect domain user information
- Used Get-ADUser to retrieve usernames, departments, account status, and password information
- Used Get-ADPrincipalGroupMembership to retrieve security group memberships
- Created a custom PowerShell object to organize account information
- Used Export-Csv to generate a user audit report
- Verified the exported CSV contained all five test accounts
- Practiced filtering account information using Where-Object

