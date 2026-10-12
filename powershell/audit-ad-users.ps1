# Active Directory User Audit
# Enterprise AD Lab - corp.local

Import-Module ActiveDirectory -ErrorAction Stop

# Configuration
$UsersOU = "OU=Users,OU=Corp,DC=corp,DC=local"
$ReportFolder = Join-Path $PSScriptRoot "reports"
$ReportPath = Join-Path $ReportFolder "ad-user-audit.csv"

# Create reports folder if it doesn't exist
if (-not (Test-Path $ReportFolder)) {
    New-Item -Path $ReportFolder -ItemType Directory | Out-Null
}

# Retrieve users and their account information
$Users = Get-ADUser -Filter * `
    -SearchBase $UsersOU `
    -Properties Department, LockedOut, PasswordLastSet, LastLogonDate

# Build the audit report
$Report = foreach ($User in $Users) {

    # Get security group memberships
    $Groups = Get-ADPrincipalGroupMembership -Identity $User |
        Select-Object -ExpandProperty Name

    [PSCustomObject]@{
        Name            = $User.Name
        Username        = $User.SamAccountName
        Department      = $User.Department
        Enabled         = $User.Enabled
        LockedOut       = $User.LockedOut
        PasswordLastSet = $User.PasswordLastSet
        LastLogonDate   = $User.LastLogonDate
        Groups          = ($Groups -join ", ")
    }
}

# Sort results alphabetically
$Report = $Report | Sort-Object Name

# Display report
Write-Host "`nACTIVE DIRECTORY USER AUDIT`n"
$Report | Format-Table Name, Username, Department, Enabled, LockedOut -AutoSize

# Export report to CSV
$Report | Export-Csv -Path $ReportPath -NoTypeInformation

Write-Host "`nReport exported to: $ReportPath"
Write-Host "Total users audited: $($Report.Count)"
