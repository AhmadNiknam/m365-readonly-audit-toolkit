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