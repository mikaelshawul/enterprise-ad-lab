# Interactive Active Directory Account Management
# Enterprise AD Lab - corp.local

Import-Module ActiveDirectory -ErrorAction Stop

$Username = $null

while ($true) {

    # Prompt for a username if none is selected
    if (-not $Username) {
        $Username = Read-Host "Enter AD username"

        try {
            $User = Get-ADUser -Identity $Username -ErrorAction Stop
        }
        catch {
            Write-Warning "User not found: $Username"
            $Username = $null
            continue
        }
    }

    # Get the latest account information
    try {
        $User = Get-ADUser -Identity $Username `
            -Properties LockedOut `
            -ErrorAction Stop
    }
    catch {
        Write-Warning "Could not retrieve account: $Username"
        $Username = $null
        continue
    }

    # Display menu
    Write-Host "`n================================"
    Write-Host "     AD ACCOUNT MANAGEMENT"
    Write-Host "================================"
    Write-Host "Current user: $Username ($($User.Name))"
    Write-Host "Enabled: $($User.Enabled) | Locked: $($User.LockedOut)"
    Write-Host ""
    Write-Host "1. Disable account"
    Write-Host "2. Enable account"
    Write-Host "3. Unlock account"
    Write-Host "4. View account status"
    Write-Host "5. Change user"
    Write-Host "6. Exit"
    Write-Host ""

    $Choice = Read-Host "Select an option (1-6)"

    try {
        switch ($Choice) {

            "1" {
                $Confirm = Read-Host "Disable ${Username}? (Y/N)"
                if ($Confirm -eq "Y") {
                    Disable-ADAccount -Identity $Username -ErrorAction Stop
                    Write-Host "Account disabled."
                }
            }

            "2" {
                $Confirm = Read-Host "Enable ${Username}? (Y/N)"
                if ($Confirm -eq "Y") {
                    Enable-ADAccount -Identity $Username -ErrorAction Stop
                    Write-Host "Account enabled."
                }
            }

            "3" {
                $Confirm = Read-Host "Unlock ${Username}? (Y/N)"
                if ($Confirm -eq "Y") {
                    Unlock-ADAccount -Identity $Username -ErrorAction Stop
                    Write-Host "Account unlocked."
                }
            }

            "4" {
                Get-ADUser -Identity $Username `
                    -Properties Department, LockedOut, PasswordLastSet |
                    Select-Object Name, SamAccountName,
                        Department, Enabled, LockedOut, PasswordLastSet |
                    Format-List
            }

            "5" {
                $Username = $null
                continue
            }

            "6" {
                Write-Host "Exiting AD management console."
                return
            }

            default {
                Write-Warning "Invalid option. Enter 1-6."
            }
        }
    }
    catch {
        Write-Warning "Operation failed: $_"
    }
}
