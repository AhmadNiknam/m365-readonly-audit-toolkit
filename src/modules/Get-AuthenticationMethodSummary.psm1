function Get-AuthenticationMethodSummary {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [int]$TopCount,

        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting authentication method summary..."

    $authSummary = Get-MgReportAuthenticationMethodUserRegistrationDetail -Top $TopCount |
        Select-Object UserDisplayName, UserPrincipalName, IsMfaRegistered, IsSsprRegistered,
        @{Name = "MethodsRegistered"; Expression = { ($_.MethodsRegistered -join ';') } }

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\AuthenticationMethodSummary.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    if (-not $authSummary) {
        Write-Host "No authentication method records were returned for this tenant."
        "" | Out-File -FilePath $outputPath -Encoding utf8
        return
    }

    $authSummary | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "Authentication method summary exported to: $outputPath"
    $authSummary | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-AuthenticationMethodSummary"
# SIG # Begin signature block
# MIIHMAYJKoZIhvcNAQcCoIIHITCCBx0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDNBGpgDrC+0yhL
# N5lcO59fHy+y9l1GCew7ul5uDb3kD6CCBBwwggQYMIICgKADAgECAhAWBo1LFawk
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
# MC8GCSqGSIb3DQEJBDEiBCC6aEcR5n5l0quomFT3VusoD8Y7kVFWV1mSJyjwm/Cu
# NzANBgkqhkiG9w0BAQEFAASCAYBn9J08NdPBIh/sqiiy9jASzRqiaECqlrkXyhWG
# xGKBqjuH/CuPFMPFHmAAVqp6Q0DwB4FNxk4OJbK1Ys8ACq7EnfLOYPOzKmhBm3Hs
# Es9kCgQKxw5loyua9wHfxFpiAMGX9ulOmci8FgCuiuBMbAtIRcNEjW6+cM9bpxFt
# /lJwH6FjHjowMoc4x2aE7Z8gYaey6ONQ7pacmtcBFkbg4oa3efSZso3vZsvzk5Hs
# dtlUkcDTprWwphzQXpC9MUpUsw5iDMoHWY6KHNrDTs7CTPCtsCZ0ICRPv/Iq39ct
# QdAma+qFCgKEyt0xXxmehRqJSpAS517AZ8cfpWdAMuVGraZdAnuQOio5oasIBN4+
# JpeIr+9A9o9EEUgv83VGhded09LRQoHFxhyjMzRYRJVsu0X3GWaLWbK18ewv8nGe
# r7KNCBfNgPEYvskgAjNFeZrodskf0AxqELkgIJ3nEO+LtZotP2U7Bpx86NvmW5xC
# 3sX9OT1gfpOzf5GHHPlUMbARO3I=
# SIG # End signature block
