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