function Get-SignInSummary {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [int]$TopCount,

        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting sign-in summary..."

    $signIns = Get-MgAuditLogSignIn -Top $TopCount |
        Select-Object CreatedDateTime, UserDisplayName, UserPrincipalName, AppDisplayName,
        @{Name = "ErrorCode"; Expression = { $_.Status.ErrorCode }},
        @{Name = "FailureReason"; Expression = { $_.Status.FailureReason }}

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\SignInSummary.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $signIns | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "Sign-in summary exported to: $outputPath"
    $signIns | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-SignInSummary"
# SIG # Begin signature block
# MIIHMAYJKoZIhvcNAQcCoIIHITCCBx0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD36kSxfLdDsbuG
# DPiyehwTeHm6k1MjA6u3dWSNwZ0ol6CCBBwwggQYMIICgKADAgECAhAWBo1LFawk
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
# MC8GCSqGSIb3DQEJBDEiBCCCIl4ecAyejsARwk+BhZGvMzi+k/8Fpz8DJmoE7boF
# GzANBgkqhkiG9w0BAQEFAASCAYBbeENzOu+C0i6gq/953hwvifJDI18wvy5gf0BF
# WpywN9qKP7hqAx94G5JAM0Li4ArMgcWBpaOTXpJsqo8tB/NAlYhr+mKhBHC8muDm
# /JTvAVEXYtTsCzNMEbZz9ydmnZ8c8h/85Py6U4tZckzFgK7/muIagz7D64DNH80d
# YG30YcWTL3isVYDw0xVGWeXT2osdS8B1f0MP3viyLGn1J7dZq5pTyFdtNUVzMjEj
# fegAkvHqVUy9QLlK02dOd6lF9VqupqF4NZJAX60pMtKYnHZiE2V35H5eL3AEeWGA
# B1KYM59PIQmRfxTxPuFNCWxVw9wrwCyKHdREHzHlDm/5V5j7Vh3rFG5OZOKim2nB
# 9vMvibH6uUpF3K5Ti/Dc6OByZt5xl9XEoK8KhpKeYZ/l6E8xEx9MZv6IOWd4Zoce
# a8Xu5oZbgZgXKfd1ECk5os0pHvAXv4jsqY4i2AEVOE7J9e+agnFXbueUY1Bt+Qjs
# yNebbhlExBfePTzwpGph9i/7wY0=
# SIG # End signature block
