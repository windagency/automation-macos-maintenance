# macOS Maintenance Script

This script automates several common maintenance tasks for macOS, including updating package managers, App Store applications, and cleaning up system files.

## Features

* **Homebrew Update**: Updates and upgrades Homebrew packages and casks, then cleans up old versions.
* **App Store App Update**: Installs all available software updates from the App Store.
* **Manual Intervention Prompt**: Pauses execution to allow for manual intervention if required during the update process.

## Usage

1. **Save the script**: Save the provided content as `macos-maintenance.sh` on your macOS system.
2. **Make it executable**: Open Terminal and navigate to the directory where you saved the script. Then, run the following command:

    ```bash
    chmod +x macos-maintenance.sh
    ```

3. **Run the script**: Execute the script from the Terminal:

    ```bash
    ./macos-maintenance.sh
    ```

## Script Details

The script performs the following actions:

### Update package managers

* Updates Homebrew:
  * `brew update && brew upgrade`
  * `brew upgrade --cask --greedy`
  * `brew cleanup`

### Update App Store apps

* Installs all available App Store updates:
  * `softwareupdate -i -a`
* Prompts the user if manual intervention is needed during the App Store update process.

## Prerequisites

* **Homebrew**: Ensure Homebrew is installed if you wish to utilise the package manager update features.
* **macOS**: This script is designed for macOS operating systems.

## Customisation

* **Docker Cleanup**: The section for cleaning Docker is commented out. To enable it, uncomment the relevant lines:

    ```bash
    # echo "🐳 Cleaning Docker..."
    # docker system prune -f --volumes
    ```

* **Downloads Folder Cleanup**: The section for cleaning the Downloads folder is commented out. To enable it, uncomment the relevant lines:

    ```bash
    # echo "🗑️ Cleaning Downloads..."
    # find ~/Downloads -mtime +30 -exec mv {} ~/.Trash \;
    ```

    This command moves files older than 30 days from the Downloads folder to the Trash. You can adjust `+30` to a different number of days if needed.

## Restricted Account

```bash
sudo chmod -R g+w /opt/homebrew
sudo chgrp -R admin /opt/homebrew
```
