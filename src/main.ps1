Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Import-Module "$PSScriptRoot\modules\Connect-Toolkit.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-ToolkitSettings.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-UserInventory.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-SignInSummary.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-GroupInventory.psm1" -Force

$settings = Get-ToolkitSettings

Write-Host "M365 Read-Only Audit Toolkit - starting..."
Write-Host "Configured UserInventoryTop: $($settings.UserInventoryTop)"
Write-Host "Configured SignInTop: $($settings.SignInTop)"
Write-Host "Configured GroupInventoryTop: $($settings.GroupInventoryTop)"
Write-Host "Configured OutputFolder: $($settings.OutputFolder)"

Connect-Toolkit
Get-UserInventory -TopCount $settings.UserInventoryTop -OutputFolder $settings.OutputFolder
Get-SignInSummary -TopCount $settings.SignInTop -OutputFolder $settings.OutputFolder
Get-GroupInventory -TopCount $settings.GroupInventoryTop -OutputFolder $settings.OutputFolder