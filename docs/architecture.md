# Architecture

## Current flow

1. main.ps1 starts the toolkit
2. Connect-Toolkit checks Microsoft Graph connection
3. Get-UserInventory collects user details and exports UserInventory.csv
4. Get-SignInSummary collects sign-in events and exports SignInSummary.csv