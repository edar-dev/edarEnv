function Install-Scoop {
    param ([hashtable]$config)

    Write-Host "Installazione di Scoop..."
    Show-Progress -PercentComplete 10 -Activity "Scoop" -Status "Inizializzazione installazione di Scoop..."
    $env:SCOOP='C:\Scoop'
    [Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, [EnvironmentVariableTarget]::Machine)
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

    if ($config.bucket -ne "main") {
        Show-Progress -PercentComplete 50 -Activity "Scoop" -Status "Aggiunta del bucket $($config.bucket)..."
        scoop bucket add $config.bucket
    }

    Show-Progress -PercentComplete 100 -Activity "Scoop" -Status "Installazione completata."
    Write-Host "Scoop installato con successo."
}
