# Architecture

## Current flow

1. `main.ps1` starts the toolkit
2. `Get-ToolkitSettings` reads settings from `config/settings.json`
3. `Connect-Toolkit` checks Microsoft Graph connection
4. `Get-UserInventory` collects user details and exports `UserInventory.csv`
5. `Get-SignInSummary` collects sign-in events and exports `SignInSummary.csv`
6. `Get-GroupInventory` collects group details and exports `GroupInventory.csv`
7. `Get-DisabledUserInventory` collects disabled user details and exports `DisabledUserInventory.csv`
8. `Get-LicensedUserInventory` collects licensed user details and exports `LicensedUserInventory.csv`
9. `Get-AuthenticationMethodSummary` collects authentication method details and exports `AuthenticationMethodSummary.csv`
10. `Get-DirectoryRoleSummary` collects directory role details and exports `DirectoryRoleSummary.csv`
11. `Get-DirectoryRoleMembers` collects directory role member details and exports `DirectoryRoleMembers.csv`
12. `Get-ExecutiveSummary` generates `ExecutiveSummary.md`

## Configuration model

The toolkit currently reads these values from `config/settings.json`:

- `UserInventoryTop`
- `SignInTop`
- `GroupInventoryTop`
- `OutputFolder`
## Trust and signing model

This project uses two verification layers:

- GitHub verified signed commits and signed release tags
- PowerShell Authenticode signatures on `.ps1` and `.psm1` files

The public code-signing certificate is distributed in the repository for verification use:

- `signing/AhmadNiknam-CodeSigning.cer`

Private signing material is not included in the repository.