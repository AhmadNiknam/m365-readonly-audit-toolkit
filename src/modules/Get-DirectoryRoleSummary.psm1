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