Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Import-Module "$PSScriptRoot\modules\Connect-Toolkit.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-ToolkitSettings.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-UserInventory.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-SignInSummary.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-GroupInventory.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-DisabledUserInventory.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-LicensedUserInventory.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-AuthenticationMethodSummary.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-ExecutiveSummary.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-DirectoryRoleSummary.psm1" -Force
Import-Module "$PSScriptRoot\modules\Get-DirectoryRoleMembers.psm1" -Force

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
Get-DisabledUserInventory -TopCount $settings.UserInventoryTop -OutputFolder $settings.OutputFolder
Get-LicensedUserInventory -TopCount $settings.UserInventoryTop -OutputFolder $settings.OutputFolder
Get-AuthenticationMethodSummary -TopCount $settings.UserInventoryTop -OutputFolder $settings.OutputFolder
Get-ExecutiveSummary -OutputFolder $settings.OutputFolder
Get-DirectoryRoleSummary -OutputFolder $settings.OutputFolder
Get-DirectoryRoleMembers -OutputFolder $settings.OutputFolder
# SIG # Begin signature block
# MIIHMAYJKoZIhvcNAQcCoIIHITCCBx0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCjTGmvj1kfBgL1
# vbiLV/MF52a2RkvUP5Z5yiC1yHFRTqCCBBwwggQYMIICgKADAgECAhAWBo1LFawk
# hkKc3TMg/2YZMA0GCSqGSIb3DQEBCwUAMCQxIjAgBgNVBAMMGUFobWFkIE5pa25h
# bSBDb2RlIFNpZ25pbmcwHhcNMjYwNDIxMDM0MTEzWhcNMjgwNDIxMDM1MTEyWjAk
# MSIwIAYDVQQDDBlBaG1hZCBOaWtuYW0gQ29kZSBTaWduaW5nMIIBojANBgkqhkiG
# 9w0BAQEFAAOCAY8AMIIBigKCAYEA391Cdv4dTpCP6/O4g487jHsQ0jyqRFiPqKiE
# jm7Am81ZzRM/GMurLrMt5rIGzp7wbF2sOpO3ZyOMgXatrgJAZq/C6Fn7pWq+yaBx
# BIelUOD3E+EpSEclK667K4uWOLCfYAqsXVxf6o29d0Q5NR2LW5Ag9CsoxV1DnJbG
# 02c5x/mHimoc2TSCVglZIm9Luve0nqxfeeY0ntf1nxV9GhuhB0b2ysfxB/nmEl3t
# zwsg3v7dP3/ZrDsjCdnQxxZJXD1+fV5GeULZOm5TPmvVHc1I+56qsa+qNiU0NbOk
# Gw2x9ttbkPga/SdjRkGSfsf3AWTGzcYMjulflGPgNyyJv78lRv28cTMkUgcjGmwi
# XfDgf+/VabyTG3bYzgr6hItvkAslA59mykHv6L1qXpqc1Cv451GUJ4DI0fl2u0ic
# hWR3ec7Es7JTrCAnEx/ObmXnXiDsW/BcrLjb1cLT0lit0maQptVgvJyDmS2Uot28
# Km9c+h4T8zneHLWwjae5+AyW59QpAgMBAAGjRjBEMA4GA1UdDwEB/wQEAwIHgDAT
# BgNVHSUEDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUN0JfxNs2mllMkHjWcB4yTGey
# LJUwDQYJKoZIhvcNAQELBQADggGBABEsS9xve3ucaEBhRTTqS9/JHKLhoeFMA8t6
# i89ilj96QldfuVVhnnHbqefAH/Rjr1ubNaehzecBn59OmoxXhYLdrPa2K0BWqdwm
# aeaahN9MtDxjF9XQodftfh79uxl89GG5Dx6I633CsHq7yHz6J8GxA2BkxfOkuoZ3
# 5Nso3SS5g8eTP7V9XZ+6XZPF+Hn+kJGNDdl8tkxBuFRMQyGtoSEVkvgfRluanimq
# V4VEL/Oj4UCPuN5BVLVXmaYeJEejo8oV9cEXdj6KIMYm70WDIJBX2Uaimq9t6brD
# oHZKUWdtVAh8DuWgdUpLpD0kQbSMj3qYi4/MvgNGJRJlC5p0vQn+A7qCw5kt9JxT
# dB/F37HY59xHAKdtwir4Qb8J3NlDafxGfPeILxSSa55qFbWUfEEgEkZuE0IkBPkB
# Z77hzDTTCGYQqZd8mTMIt6tjvhGV9KLXyYwbJjFa87kJsrzpi9wQ7Lp0sCy/nl4I
# 2QQdQPTauY+ZReaMEAjS2YWFE332xTGCAmowggJmAgEBMDgwJDEiMCAGA1UEAwwZ
# QWhtYWQgTmlrbmFtIENvZGUgU2lnbmluZwIQFgaNSxWsJIZCnN0zIP9mGTANBglg
# hkgBZQMEAgEFAKCBhDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAAMBkGCSqGSIb3
# DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
# MC8GCSqGSIb3DQEJBDEiBCDqttbZ5BeZIsBBb57MGo+Zxukcpqm7B8ugFIYvmvx5
# zDANBgkqhkiG9w0BAQEFAASCAYBzrKRGUiwGqxJaGkMrjTxJYqNi/oED/SIJdLz6
# sUPWpehBjcsECBoh7lgMSYvP+vSBPVrhGdvwZ5EsAAlXhjEsJFhZVyDc72EUiKwG
# UrzkUV1HGs1ttkofc+jb7uMeCyynIgMFeE5Bu7u3NlXCP/8fdoB5gAIasDnPmFjA
# iI5doD+SCTw9DwJfSSk/DvrdwGyQyPtq8i0NG+YVlOP8IvzU42wD/Q3gj8/5VNcf
# dJ9IWPp+Y0jAVVRpWFBTvmTfq0JyCcGPMWkgoQ5o2hfQh17huzvMBHQOUfIua3Jq
# nJvcC0wPgJaPOJPkf5Ip/pIPtMlM6s7FOkmdLsAwB8eeuBcHDp73l/Hvx/KFV4ax
# gD1g2wbGaR3kQcgjWPwkKD/YtCEH3M5QeR+EKI4jdksnUa/IsBtGdBfEKSCWGGYY
# m3c72JglKxxD2eEjZAmYCdO21xDcqnaPt4mzvsTvzuoWVtD4qJmZtBqKexoDm3yE
# /4T5a4Dmife5Ed4f9YQWXXR74xw=
# SIG # End signature block
