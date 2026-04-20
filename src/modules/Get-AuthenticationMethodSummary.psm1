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