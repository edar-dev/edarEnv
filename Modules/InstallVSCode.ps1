function Install-VSCode {
    param ([hashtable]$config)

    Write-Host "Installazione di Visual Studio Code..."
    Show-Progress -PercentComplete 10 -Activity "Visual Studio Code" -Status "Avvio installazione di Visual Studio Code..."
    if ($config.version -eq "latest") {
        scoop install vscode
    } else {
        scoop install vscode@$config.version
    }

    if ($config.extensions.Count -gt 0) {
        foreach ($extension in $config.extensions) {
            Show-Progress -PercentComplete 50 -Activity "Visual Studio Code" -Status "Installazione estensione: $extension..."
            code --install-extension $extension
        }
    }

    Show-Progress -PercentComplete 100 -Activity "Visual Studio Code" -Status "Visual Studio Code configurato con successo."
    Write-Host "Visual Studio Code installato e configurato con successo."
}
