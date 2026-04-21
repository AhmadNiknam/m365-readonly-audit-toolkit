function Get-UserInventory {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [int]$TopCount,

        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting user inventory..."

    $users = Get-MgUser -Top $TopCount -Property "DisplayName,UserPrincipalName,UserType,AccountEnabled" |
        Select-Object DisplayName, UserPrincipalName, UserType, AccountEnabled

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\UserInventory.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $users | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "User inventory exported to: $outputPath"
    $users | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-UserInventory"
# SIG # Begin signature block
# MIIHMAYJKoZIhvcNAQcCoIIHITCCBx0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBq5CZ8KtrpqSLK
# O6eN43DZDAKhcIbp02PoyxHN977GeaCCBBwwggQYMIICgKADAgECAhAWBo1LFawk
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
# MC8GCSqGSIb3DQEJBDEiBCCFxrlmZqUxPMqVy+FqDOepJj/NyBcPAPYzylbODuxX
# yjANBgkqhkiG9w0BAQEFAASCAYBCqyjyQFF/kGo5kk8mW8XI3/QmNAcOCeqTCEBQ
# oQSz4sDn3DIW5wwaqmtdkEgaxew5+7K+i0FtfAkOA/vOHsCe5uPW/Zhm2/CpDYbi
# I4l8CEStYsP63BRxWYB9CSWRNsCn/QFf9TAuih1Pxk4IbNcue9S+O/qUMh3ObjsJ
# EI/5MCZqi5Ga7mjjJDmSRGVOUoRgbjxNJroqkBaR0cxZ8dd8jL7Sno7ih0TdDyg/
# M6VbrG4YUXXiV0k1WnzZzHsnk3jDLNzuYkKBo+9fPI59AEVWrnYCUaL6U0h++v3d
# nZi6ZioCGjEV5IfMtZpYsBWND30z+NW0OTlJG7W5sACTivA3JvC046ToeO3f0/fS
# k/CBDTG0ZLsjfV/yifmuTC6gZdFAKGCKSMatZvBaT3ZNCkKDlV2dL8FsW8IiL7++
# MjJRv+viANQRRAEkLvs9hJQum776RF2bDFUOcYbmvxSg4sXGkGVT987FmA6/pPqU
# 2cJJ4Rj3vyY4nUtlqrtL5nW6x5M=
# SIG # End signature block
