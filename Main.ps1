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
# Legge il contenuto del file JSON
try {
    $jsonContent = Get-Content -Path $configPath -Raw
} catch {
    Write-Error "Errore durante la lettura del file JSON: $_"
    exit 1
}

# Converte il JSON in un hashtable
try {
    $config = $jsonContent | ConvertFrom-Json -AsHashtable
} catch {
    Write-Error "Errore durante la conversione del JSON in Hashtable: $_"
    exit 1
}

# Ensure script is running as administrator
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "Please run the script as an Administrator."
    exit 1
}

# Run installation steps
Write-Output "Contenuto dell'Hashtable:"
$config.hugo | Format-Table -AutoSize

Install-Hugo $config.hugo
Install-VSCode $config.vscode
Install-Docker $config.docker
Install-Terminal $config.terminal
Install-OhMyPosh $config.ohMyPosh

Write-Host "Setup completed successfully!"
