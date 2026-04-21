function Get-DirectoryRoleMembers {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting directory role members..."

    $roles = Get-MgDirectoryRole

    $rows = foreach ($role in $roles) {
        if (-not $role.Id) {
            continue
        }

        $members = Get-MgDirectoryRoleMember -DirectoryRoleId $role.Id

        foreach ($member in $members) {
            [PSCustomObject]@{
                RoleDisplayName         = $role.DisplayName
                MemberDisplayName       = $member.AdditionalProperties.displayName
                MemberUserPrincipalName = $member.AdditionalProperties.userPrincipalName
                MemberObjectId          = $member.Id
                MemberType              = $member.AdditionalProperties.'@odata.type'
            }
        }
    }

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\DirectoryRoleMembers.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    if (-not $rows) {
        Write-Host "No directory role member records were returned for this tenant."
        "" | Out-File -FilePath $outputPath -Encoding utf8
        return
    }

    $rows | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "Directory role members exported to: $outputPath"
    $rows | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-DirectoryRoleMembers"
# SIG # Begin signature block
# MIIHMAYJKoZIhvcNAQcCoIIHITCCBx0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCf7crpzY2NXdtx
# 7OO7UfREpvJe1Nx0V2ypM9FzS+rx9KCCBBwwggQYMIICgKADAgECAhAWBo1LFawk
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
# MC8GCSqGSIb3DQEJBDEiBCAnYAn2WIJbEDN0JQyR9Egkiq5DZC83+5ze7bJdWOCm
# BTANBgkqhkiG9w0BAQEFAASCAYAN/f1rgIw9bGE0eLblwNwePDHGFE4NBkL1faMG
# K2NXOwJDTWlT24vSbIR//bVTMWQ9d3PFWf1Y/laId9nQ5GMZrLmBpIehiY2XshyB
# 47ZUnZw19KWEfvxF8FmjwmHlgXnE0ezoItNfUIbPUQ/Ke13vD17jRbDPR/7J4mOG
# IhjxI481//aQeWuI8q43OnUUouxxl5WELIbAuW3eCqHoSEjA47ZME5vN4hr7eua/
# 7jx0Avh79KyV7aNG5hjbw/mHv1Pxq3FTyrgoCcH6dwgKl5WKTgssD3oFXfEypuIX
# 4qcsPweKxJcs41eUergt4Bc9xKpwMmL3gwzgs4zuUMfHBAm6VZSMu/IiVjVPVbar
# qu+gPg7oZZDFnggXh9/SG7T4OW4wWUHbVTjflvJHUQnVQsT2Rj1FUll62BAK44zO
# oCeez9kXxRkZIaeRPCKI7HiBL+aQGoYNFx6Z5sqAWaijinCNGITgnyX4jBM5zDOk
# qq/McGJ+BdhWq4ha3Cu0hT5qx9A=
# SIG # End signature block
