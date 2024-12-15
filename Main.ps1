# Load modules
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$modulePath = Join-Path $scriptPath "Modules"

# Import custom modules
. (Join-Path $modulePath "ProgressUtils.ps1")

# Load configuration file
$configPath = Join-Path $scriptPath "config.json"
if (-Not (Test-Path $configPath)) {
    Write-Error "Configuration file not found: $configPath"
    exit 1
}

# Convert JSON to Hashtable (explicit conversion)
$configObject = Get-Content -Path $configPath | ConvertFrom-Json
$config = @{}
$configObject.PSObject.Properties | ForEach-Object { $config[$_.Name] = $_.Value }

# Example usage
Write-Host "Starting setup with configuration:"
Write-Host $config

# Example: Install Hugo
if ($config["hugo"]["version"]) {
    Write-Host "Installing Hugo version $($config["hugo"]["version"])..."
    scoop install hugo
    Write-Host "Hugo installed successfully."
}

# Continue with other modules...
