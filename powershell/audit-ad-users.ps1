# Active Directory User Audit
# Run on DC1 with the ActiveDirectory module

Import-Module ActiveDirectory

$SearchBase = "OU=Users,OU=Corp,DC=corp,DC=local"

Get-ADUser -Filter * -SearchBase $SearchBase -Properties Department, LastLogonDate |
    Select-Object Name, SamAccountName, Enabled, Department, LastLogonDate |
    Sort-Object Name |
    Format-Table -AutoSize
