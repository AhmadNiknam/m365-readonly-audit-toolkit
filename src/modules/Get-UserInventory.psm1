function Get-UserInventory {
    [CmdletBinding()]
    param()

    Write-Host "Getting user inventory..."

    $users = Get-MgUser -Top 10 -Property "DisplayName,UserPrincipalName,UserType,AccountEnabled" |
        Select-Object DisplayName, UserPrincipalName, UserType, AccountEnabled

    $outputPath = Join-Path $PSScriptRoot "..\..\sample-output\UserInventory.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $users | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "User inventory exported to: $outputPath"
    $users | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-UserInventory"