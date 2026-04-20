Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Import-Module "$PSScriptRoot\modules\Connect-Toolkit.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-UserInventory.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-SignInSummary.psm1" -Force

Write-Host "M365 Read-Only Audit Toolkit - starting..."
Connect-Toolkit
Get-UserInventory
Get-SignInSummary