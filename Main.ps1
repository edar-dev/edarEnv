# Main.ps1

# Import all modules
. .\Modules\ProgressUtils.ps1
. .\Modules\InstallHugo.ps1
. .\Modules\InstallVSCode.ps1
. .\Modules\InstallDocker.ps1
. .\Modules\InstallTerminal.ps1
. .\Modules\InstallOhMyPosh.ps1

# Load configuration file
$configPath = ".\config.json"
if (-Not (Test-Path $configPath)) {
    Write-Error "Configuration file not found: $configPath"
    exit 1
}

$config = Get-Content -Path $configPath | ConvertFrom-Json

# Ensure script is running as administrator
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Please run the script as an Administrator."
    exit 1
}

# Run installation steps
Install-Hugo $config.hugo
Install-VSCode $config.vscode
Install-Docker $config.docker
Install-Terminal $config.terminal
Install-OhMyPosh $config.ohMyPosh

Write-Host "Setup completed successfully!"
