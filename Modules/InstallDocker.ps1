function Install-Docker {
    param ([hashtable]$config)

    Write-Host "Installazione di Docker..."
    Show-Progress -PercentComplete 10 -Activity "Docker" -Status "Preparazione..."

    if ($config.useDesktop -eq $true) {
        Write-Host "Installazione di Docker Desktop tramite winget..."
        winget install -e --id Docker.DockerDesktop -h --accept-source-agreements --accept-package-agreements
    } else {
        Write-Host "Installazione di Docker CLI tramite Scoop..."
        scoop install docker
    }

    Show-Progress -PercentComplete 100 -Activity "Docker" -Status "Docker installato con successo."
    Write-Host "Docker installato con successo."
}
