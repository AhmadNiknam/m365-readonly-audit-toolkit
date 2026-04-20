function Get-ExecutiveSummary {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$OutputFolder
    )

    Write-Host "Creating executive summary..."

    $outputPath = Join-Path $PSScriptRoot "..\..\$OutputFolder\ExecutiveSummary.md"
    $outputPath = [System.IO.Path]::GetFullPath($outputPath)

    $content = @"
# Executive Summary

This toolkit was executed successfully in the Microsoft 365 lab tenant.

## Generated outputs

- UserInventory.csv
- SignInSummary.csv
- GroupInventory.csv
- DisabledUserInventory.csv
- LicensedUserInventory.csv
- AuthenticationMethodSummary.csv

## Purpose

This project provides a read-only audit workflow for Microsoft 365 lab validation and portfolio demonstration.
"@

    $content | Out-File -FilePath $outputPath -Encoding utf8

    Write-Host "Executive summary exported to: $outputPath"
}

Export-ModuleMember -Function "Get-ExecutiveSummary"