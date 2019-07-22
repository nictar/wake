#!/usr/bin/env bash

echo "Commence qsetup."
echo "Before we proceed, please sign in to the Mac App Store for mas-cli to work."
echo "Ready to go? [yes|no]"
read -p "[no] >>> "
if [[ $REPLY =~ ^[yY] ]]; then
    echo
else
    echo "ERROR: cannot proceed until you have signed in. Please try again."
    exit 1
fi

echo "You also need to have installed Xcode CLT."
echo "You can do so by opening a new Terminal instance and running:"
echo
echo "xcode-select --install"
echo
echo "Ready to go? [yes|no]"
read -p "[no] >>> "
if [[ $REPLY =~ ^[yY] ]]; then
    echo "Let's start!"
    echo
else
    echo "ERROR: cannot proceed until you have downloaded the CLT. Please try again."
    exit 1
fi

# Fix sub-pixel AA
echo "Fixing subpixel AA..."
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

# Install Homebrew
echo && echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Update and upgrade Homebrew
echo && echo "Updating Homebrew..."
brew update && brew upgrade

# Opt out of Homebrew's analytics
echo && echo "Opting out of Homebrew's analytics..."
brew analytics off

# Install Brewfile
echo && echo "Installing tools and applications from ./Brewfile..."
brew bundle

# Install Cocoapods
sudo gem install cocoapods

# Download theme for iTerm
echo "Copying iTerm theme file to ~/Downloads..."
cp others/OneSnazzy.itermcolors $HOME/Downloads/

# Setup VSCode
bash setup-scripts/vscode-setup.sh

# Install fonts
bash setup-scripts/font-setup.sh

# Setup new git and git-lfs
bash setup-scripts/git-setup.sh
git lfs install

# Setup vim
bash setup-scripts/vim-setup.sh

# Setup fish
bash setup-scripts/fish-setup.sh

# Cleanup
sudo xcodebuild -license accept
brew update && brew upgrade && brew cleanup && brew doctor

echo && echo "qsetup completed! Remember to restart for some changes to take into effect."
