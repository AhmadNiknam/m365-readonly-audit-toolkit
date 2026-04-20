# M365 Read-Only Audit Toolkit

A PowerShell-based read-only audit toolkit for a Microsoft 365 lab tenant.

## Current features

- Checks Microsoft Graph connection
- Reads toolkit settings from `config/settings.json`
- Retrieves user inventory from the lab tenant
- Retrieves sign-in summary from the lab tenant
- Retrieves group inventory from the lab tenant
- Retrieves disabled user inventory from the lab tenant
- Retrieves licensed user inventory from the lab tenant
- Exports audit results to CSV files

## Current outputs

- `sample-output/UserInventory.csv`
- `sample-output/SignInSummary.csv`
- `sample-output/GroupInventory.csv`
- `sample-output/DisabledUserInventory.csv`
- `sample-output/LicensedUserInventory.csv`

## Project structure

- `src/` PowerShell entry script and modules
- `config/` configuration files
- `docs/` project notes and architecture
- `sample-output/` generated sample CSV outputs

## How to run

1. Connect to Microsoft Graph in PowerShell:
   `Connect-MgGraph -Scopes "User.Read.All","AuditLog.Read.All","Group.Read.All" -UseDeviceAuthentication -ContextScope Process`

2. Run the toolkit:
   `.\src\main.ps1`

## Notes

- This project is for lab and portfolio use
- It is designed for read-only Microsoft 365 audit validation
- CSV outputs are excluded from Git tracking by `.gitignore`

## Safety

This project is designed as a read-only lab audit toolkit. It does not make production changes.