function Get-DirectoryRoleSummary {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting directory role summary..."

    $roles = Get-MgDirectoryRole -Property "DisplayName,Description,RoleTemplateId" |
        Select-Object DisplayName, Description, RoleTemplateId

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\DirectoryRoleSummary.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $roles | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "Directory role summary exported to: $outputPath"
    $roles | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-DirectoryRoleSummary"
# SIG # Begin signature block
# MIIHMAYJKoZIhvcNAQcCoIIHITCCBx0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBSrqLAoFga2cnV
# rl6z/J14iciWOMwBElor1vp6NUAHKaCCBBwwggQYMIICgKADAgECAhAWBo1LFawk
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
# MC8GCSqGSIb3DQEJBDEiBCCx9s4nGDtXp0/XuM4EytR9RNVgFSNoCHXU6kEZgE1G
# nzANBgkqhkiG9w0BAQEFAASCAYCkRSmNQGhLBLA0FAsQeHGZHbn849K2KefTu3dy
# O3NdbsYX+gtPi6+QBJM8nr0rbRGmxbzRsLZBZFx9LfnHErhej125s6Lvi5ID7n73
# uNpFawtaqS54bcSKnUYV5OCcDOMGAvopFC1/1ZwZlguxPLaLA3tbBehrB/tddT07
# 3d0UACkF2M6j2at44gjTIm3jdsyEDu+K6PwGuIF5fOT0Q1JJGzFl0RmIq8M0pkiT
# wqEGPyZCtReUW1YnrSG5cn3y/y2Pq8aJE3ncQRGXiXOhY1X0B63Xjrd/e1jbCK+y
# 0LeGSme/yUZMDILEqvwPXE6O6ajg0RbVRbI9l8rlM5k2KKmXQ8ihMbFv7Uv4EzH8
# 4+aWq4CBykNsiQZ6pX/ugf72jPhhAQPwFBqkTJTQtcbeAFa/Nhs1IC5YlMrr7GRa
# KM5HM4TW/WYpMJ+WGu6drtN/NSHwKcde1cNfqHtX9J+pwpYwFTxo9uda3YW2ilTz
# 3zI9b9qA4x+EhXe2SDM5ePYXak8=
# SIG # End signature block
