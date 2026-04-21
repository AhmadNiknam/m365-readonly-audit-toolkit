function Get-ToolkitSettings {
    [CmdletBinding()]
    param()

    $settingsPath = Join-Path $PSScriptRoot "..\..\config\settings.json"
    $settingsPath = [System.IO.Path]::GetFullPath($settingsPath)

    if (-not (Test-Path $settingsPath)) {
        throw "Settings file not found: $settingsPath"
    }

    Get-Content -Path $settingsPath -Raw | ConvertFrom-Json
}

Export-ModuleMember -Function "Get-ToolkitSettings"
# SIG # Begin signature block
# MIIHMAYJKoZIhvcNAQcCoIIHITCCBx0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDJjdGBa9XllxxT
# jxpu6QfBwpTaS11KZ1hpDw1XynAQ16CCBBwwggQYMIICgKADAgECAhAWBo1LFawk
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
# MC8GCSqGSIb3DQEJBDEiBCC0cOQJttOujJ7kAzT2oH4uvp9xzkIM6xX1yaCcF81a
# UTANBgkqhkiG9w0BAQEFAASCAYDfLGQTwWOUhtVf8l9i0FnDoOPJi70Iz0tF1eLs
# /Uw3KM3kSyzMfU9ZksakBsB2HGobDD41M6cvy+enpvUry1mkWWyfVLBS+4dI8BiZ
# kB8hMwnF4FzQVTKjoZ28bU5N4aJwE5EJyMv6hYIf3fXpb8IW5/pBOQHTAKOhNp/f
# vKnKJjflxse/WZYsovwhwTyIsHF6WYRwZp7WP/9AIQGwj+E/le++2ZH9yRuMghJX
# hhpsmTbkl0DiiHehTX50PtGmpwYvrIqkYZo/dL5uPqCuQlS9vOWp6vALA+vl9xdi
# 3JXkXpkh5mlk4nX/gIXjOKAlZfIu9hUpCZ9k8Sz+tl6d/47zyb1OtFcrz8NOFZsE
# R9FdJ2uhpaebqWwTuDAWrXgxnZL0TZ5v0xEOo58QW6YCA516wxV1POEXdy3kwrwp
# JdrL5uJO8gc1Xqzyo3lSaIoL3Xgg/ld3tjNK5rZvHg+gFczL2wwjV2HIMTg3Dh1n
# /5JUhCrG8Oq7nr6e1dRt0aof1Co=
# SIG # End signature block
