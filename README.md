# M365 Read-Only Audit Toolkit

A PowerShell-based read-only audit toolkit for a Microsoft 365 lab tenant.

## Current features

- Checks Microsoft Graph connection
- Retrieves user inventory from the lab tenant
- Retrieves sign-in summary from the lab tenant
- Exports audit results to CSV files

## Current outputs

- `sample-output/UserInventory.csv`
- `sample-output/SignInSummary.csv`

## Project structure

- `src/` PowerShell entry script and modules
- `config/` configuration files
- `docs/` project notes and architecture
- `sample-output/` generated sample CSV outputs

## Safety

This project is designed as a read-only lab audit toolkit. It does not make production changes.