function Get-LicensedUserInventory {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [int]$TopCount,

        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting licensed user inventory..."

    $users = Get-MgUser -Top $TopCount -Property "DisplayName,UserPrincipalName,AssignedLicenses,AccountEnabled" |
        Where-Object { $_.AssignedLicenses.Count -gt 0 } |
        Select-Object DisplayName, UserPrincipalName, AccountEnabled,
        @{Name = "LicenseCount"; Expression = { $_.AssignedLicenses.Count } }

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\LicensedUserInventory.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $users | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "Licensed user inventory exported to: $outputPath"
    $users | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-LicensedUserInventory"
# SIG # Begin signature block
# MIIHMAYJKoZIhvcNAQcCoIIHITCCBx0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCYwcrdI7RP48FP
# +9Vw1TYLvbb9IIc4bOYNXeaMGwyz2KCCBBwwggQYMIICgKADAgECAhAWBo1LFawk
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
# MC8GCSqGSIb3DQEJBDEiBCDj33n0W/9M1GTGU32Xoqs2ua+XtCi1Duv5ZfxpYGVO
# mjANBgkqhkiG9w0BAQEFAASCAYC4dUWT2VV9LXAkVhOETICYPuvgkEJ2N4MNDN+9
# hsigj1bl1cIEJnoJ3/QJckRbNVB89+K0bieN5n/69YC+TP0vjtqkTWjfXUTRotdB
# Pcv9jQhKdWjHuHVbWFFFYLl7+ZI/DSncshmqCLpNRHvic++Fg4qUBBW1MnsAvPaP
# jAIMsoB173r2a+loJrMLlwAcO+u7XZ5T+TF4b/glgA/gIKDnYruTe1GYw8vmFHkM
# tSTEpW4NnIJpJY9Ihs0/uZoi85sqSejuVstY2sUlGle0nGE6Y8Ce0K+S/glY6xAJ
# U6dxS54lSSIO66uTB+WOzTbmmLKy6Op2Qve/smGqTwoTFE6VaG1t8T4sQRVbgFVV
# eXjbNEdwIRHwMxtJ7OjlQyCfGoGdOpgI+d4MK+DZrOs01IEewN7SC9rx+YWwBTdX
# KBcmFQT5rV1lzT78eY6ZSq1pAhPl9xrGVmHLGCOUUvHS/6N25JM+C57gF3O2hKvR
# u5cLAa9O8rDdgJc8OFQPgS36Lr8=
# SIG # End signature block
