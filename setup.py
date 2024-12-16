import os
import subprocess

# Helper function to execute a command
def run_command(command):
    print(f"Executing: {command}")
    process = subprocess.run(command, shell=True)
    if process.returncode != 0:
        print(f"ERROR: Command failed: {command}")
        exit(1)

# Scoop installation commands
def install_with_scoop(package):
    print(f"Installing {package} with Scoop...")
    run_command(f"scoop install {package}")

# Main setup function
def main():
    print("=======================================================")
    print("Python Setup Script: Installing Additional Dependencies")
    print("=======================================================")

    # Install additional dependencies
    dependencies = ["hugo", "vscode", "docker", "oh-my-posh", "windows-terminal"]
    for package in dependencies:
        install_with_scoop(package)

    # Configure Windows Terminal (example)
    print("Configuring Windows Terminal...")
    terminal_settings_url = "https://example.com/terminal-settings.json"
    settings_path = os.path.expanduser("~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json")
    run_command(f"curl -L {terminal_settings_url} -o \"{settings_path}\"")

    print("=======================================================")
    print("Setup completed successfully!")
    print("=======================================================")

if __name__ == "__main__":
    main()
