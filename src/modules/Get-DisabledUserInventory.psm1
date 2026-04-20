function Get-DisabledUserInventory {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [int]$TopCount,

        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting disabled user inventory..."

    $users = Get-MgUser -Top $TopCount -Property "DisplayName,UserPrincipalName,UserType,AccountEnabled" |
        Where-Object { $_.AccountEnabled -eq $false } |
        Select-Object DisplayName, UserPrincipalName, UserType, AccountEnabled

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\DisabledUserInventory.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $users | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "Disabled user inventory exported to: $outputPath"
    $users | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-DisabledUserInventory"