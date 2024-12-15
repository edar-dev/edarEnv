function Install-Terminal {
    param ([hashtable]$config)

    Write-Host "Installing Windows Terminal..."
    Show-Progress -PercentComplete 10 -Activity "Windows Terminal" -Status "Starting installation..."

    # Install Windows Terminal using winget
    winget install -e --id Microsoft.WindowsTerminal -h --accept-source-agreements --accept-package-agreements

    Show-Progress -PercentComplete 50 -Activity "Windows Terminal" -Status "Installation complete."

    if ($config.usePowerShellAsDefault -eq $true) {
        Write-Host "Setting PowerShell as the default terminal..."

        # Locate Windows Terminal settings file
        $settingsPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
        if (Test-Path $settingsPath) {
            $settings = Get-Content $settingsPath -Raw | ConvertFrom-Json
            $settings.profiles.defaults.source = "Windows.Terminal.PowershellCore"
            $settings | ConvertTo-Json -Depth 10 | Set-Content $settingsPath
        } else {
            Write-Warning "Unable to locate settings.json for Windows Terminal."
        }
    }

    Show-Progress -PercentComplete 100 -Activity "Windows Terminal" -Status "Configuration complete."
    Write-Host "Windows Terminal installed and configured successfully."
}
