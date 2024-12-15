function Install-Git {
    param ([hashtable]$config)

    Write-Host "Installazione di Git..."
    Show-Progress -PercentComplete 10 -Activity "Git" -Status "Avvio installazione di Git..."
    if ($config.version -eq "latest") {
        scoop install git
    } else {
        scoop install git@$config.version
    }
    Show-Progress -PercentComplete 100 -Activity "Git" -Status "Git installato con successo."
    Write-Host "Git installato con successo."
}
