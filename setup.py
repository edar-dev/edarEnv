import os
import json
import subprocess
import sys

# Helper function to execute a command
def run_command(command):
    print(f"Executing: {command}")
    process = subprocess.run(command, shell=True)
    if process.returncode != 0:
        print(f"ERROR: Command failed: {command}")
        sys.exit(1)

# Scoop installation commands
def install_with_scoop(package):
    print(f"Installing {package} with Scoop...")
    run_command(f"scoop install {package}")

# Main setup function
def main(config_path):
    # Read configuration file
    with open(config_path, "r") as config_file:
        config = json.load(config_file)

    print("=======================================================")
    print("Python Setup Script: Installing Dependencies")
    print("=======================================================")

    # Install dependencies from config
    dependencies = config.get("dependencies", [])
    for package in dependencies:
        install_with_scoop(package)

    # Perform additional setup (e.g., configuring Windows Terminal)
    terminal_settings = config.get("terminal_settings_url")
    if terminal_settings:
        print("Configuring Windows Terminal...")
        settings_path = os.path.expanduser(
            "~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"
        )
        run_command(f"curl -L {terminal_settings} -o \"{settings_path}\"")

    print("=======================================================")
    print("Setup completed successfully!")
    print("=======================================================")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("ERROR: Configuration file path is required.")
        sys.exit(1)
    main(sys.argv[1])
