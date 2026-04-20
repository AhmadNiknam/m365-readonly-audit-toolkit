function Get-GroupInventory {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [int]$TopCount,

        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting group inventory..."

    $groups = Get-MgGroup -Top $TopCount -Property "DisplayName,Mail,SecurityEnabled,MailEnabled,GroupTypes" |
        Select-Object DisplayName, Mail, SecurityEnabled, MailEnabled,
        @{Name = "GroupTypes"; Expression = { ($_.GroupTypes -join ';') }}

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\GroupInventory.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $groups | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "Group inventory exported to: $outputPath"
    $groups | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-GroupInventory"