function Install-OhMyPosh {
    param ([hashtable]$config)

    Write-Host "Installazione di Oh My Posh..."
    Show-Progress -PercentComplete 10 -Activity "Oh My Posh" -Status "Avvio installazione..."

    # Installa Oh My Posh tramite Scoop
    scoop install oh-my-posh

    Show-Progress -PercentComplete 50 -Activity "Oh My Posh" -Status "Configurazione di Oh My Posh..."

    # Scarica la configurazione da URL
    if ($config.configUrl) {
        $configPath = "$HOME\Documents\posh-config.json"
        Invoke-WebRequest -Uri $config.configUrl -OutFile $configPath
        Write-Host "Configurazione scaricata: $configPath"
    }

    # Aggiorna il profilo PowerShell
    $profilePath = "$PROFILE"
    if (-Not (Test-Path $profilePath)) {
        New-Item -ItemType File -Path $profilePath -Force
    }
    Add-Content -Path $profilePath -Value "oh-my-posh init pwsh --config $HOME\Documents\posh-config.json | Invoke-Expression"

    Show-Progress -PercentComplete 100 -Activity "Oh My Posh" -Status "Oh My Posh installato e configurato."
    Write-Host "Oh My Posh installato e configurato con successo."
}
