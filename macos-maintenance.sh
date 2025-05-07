#!/bin/bash
echo "🧹 Starting weekly maintenance..."

# Update package managers
echo "📦 Updating Homebrew..."
brew update && brew upgrade
brew upgrade --cask --greedy
brew cleanup

# Update App Store apps
echo "🏪 Updating App Store apps..."
softwareupdate -i -a
# Monitor for manual intervention requirement
while true; do
    read -r -p "Do you need to intervene manually? (y/n): " response
    case $response in
        y|Y )
            echo "Waiting for manual intervention..."
            read -p "Press Enter when ready to continue..."
            ;;
        n|N ) break;;
        * ) echo "Please enter y or n.";;
    esac
done

# Clean up Docker
# echo "🐳 Cleaning Docker..."
# docker system prune -f --volumes

# Clean up downloads folder
# echo "🗑️ Cleaning Downloads..."
# find ~/Downloads -mtime +30 -exec mv {} ~/.Trash \;

echo "✨ Maintenance complete!"