function Show-Progress {
    param (
        [int]$PercentComplete,
        [string]$Activity = "",
        [string]$Status = ""
    )
    Write-Progress -PercentComplete $PercentComplete -Activity $Activity -Status $Status
}
