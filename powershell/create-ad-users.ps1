# Bulk Active Directory User Provisioning
# Enterprise AD Lab - corp.local

Import-Module ActiveDirectory

# Configuration
$CsvPath = Join-Path $PSScriptRoot "new-users.csv"
$UsersOU = "OU=Users,OU=Corp,DC=corp,DC=local"

# Check that the CSV exists
if (-not (Test-Path $CsvPath)) {
    Write-Error "CSV file not found: $CsvPath"
    return
}

# Import users from CSV
$Users = Import-Csv $CsvPath

# Prompt for temporary password once
$TempPassword = Read-Host "Enter temporary password for new users" -AsSecureString

foreach ($User in $Users) {
    $Username = $User.Username.Trim()
    $GroupName = $User.Group.Trim()

    # Check if user already exists
    if (Get-ADUser -Filter "SamAccountName -eq '$Username'") {
        Write-Warning "$Username already exists. Skipping."
        continue
    }

    # Check if security group exists
    try {
        Get-ADGroup -Identity $GroupName -ErrorAction Stop | Out-Null
    }
    catch {
        Write-Warning "Group $GroupName not found. Skipping $Username."
        continue
    }

    try {
        # Create and enable user account
        New-ADUser `
            -Name "$($User.FirstName) $($User.LastName)" `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -SamAccountName $Username `
            -UserPrincipalName "$Username@corp.local" `
            -Department $User.Department `
            -Path $UsersOU `
            -AccountPassword $TempPassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true `
            -ErrorAction Stop

        # Add user to security group
        Add-ADGroupMember `
            -Identity $GroupName `
            -Members $Username `
            -ErrorAction Stop

        Write-Host "Created $Username and added to $GroupName"
    }
    catch {
        Write-Warning "Failed to process ${Username}: $_"
    }
}
