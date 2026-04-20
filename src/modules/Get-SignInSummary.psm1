function Get-SignInSummary {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [int]$TopCount,

        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Getting sign-in summary..."

    $signIns = Get-MgAuditLogSignIn -Top $TopCount |
        Select-Object CreatedDateTime, UserDisplayName, UserPrincipalName, AppDisplayName,
        @{Name = "ErrorCode"; Expression = { $_.Status.ErrorCode }},
        @{Name = "FailureReason"; Expression = { $_.Status.FailureReason }}

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\SignInSummary.csv"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $signIns | Export-Csv -Path $outputPath -NoTypeInformation

    Write-Host "Sign-in summary exported to: $outputPath"
    $signIns | Format-Table -AutoSize
}

Export-ModuleMember -Function "Get-SignInSummary"