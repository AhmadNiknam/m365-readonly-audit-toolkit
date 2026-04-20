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