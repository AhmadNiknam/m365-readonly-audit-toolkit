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

## Configuration model

The toolkit currently reads these values from `config/settings.json`:

- `UserInventoryTop`
- `SignInTop`
- `GroupInventoryTop`
- `OutputFolder`