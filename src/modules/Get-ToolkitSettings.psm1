function Get-ToolkitSettings {
    [CmdletBinding()]
    param()

    $settingsPath = Join-Path $PSScriptRoot "..\..\config\settings.json"
    $settingsPath = [System.IO.Path]::GetFullPath($settingsPath)

    if (-not (Test-Path $settingsPath)) {
        throw "Settings file not found: $settingsPath"
    }

    Get-Content -Path $settingsPath -Raw | ConvertFrom-Json
}

Export-ModuleMember -Function "Get-ToolkitSettings"