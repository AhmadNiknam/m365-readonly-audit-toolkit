function Connect-Toolkit {
    [CmdletBinding()]
    param()

    Write-Host "Checking Microsoft Graph connection..."

    $context = Get-MgContext

    if (-not $context) {
        throw "Microsoft Graph is not connected."
    }

    Write-Host "Connected account: $($context.Account)"
    Write-Host "Connected tenant: $($context.TenantId)"
}

Export-ModuleMember -Function "Connect-Toolkit"