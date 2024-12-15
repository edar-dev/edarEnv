function Install-Hugo {
    param ([hashtable]$config)

    Write-Host "Installazione di Hugo..."
    Show-Progress -PercentComplete 10 -Activity "Hugo" -Status "Avvio installazione di Hugo..."
    if ($config.version -eq "latest") {
        scoop install hugo
    } else {
        scoop install hugo@$config.version
    }
    Show-Progress -PercentComplete 100 -Activity "Hugo" -Status "Hugo installato con successo."
    Write-Host "Hugo installato con successo."
}
