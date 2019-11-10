#!/usr/bin/env bash

vscode_settings_file="./settings.json"
vscode_settings_dir="$HOME/Library/Application Support/Code/User/"

# Install extensions
code --install-extension zhuangtongfa.material-theme
code --install-extension ms-python.python
code --install-extension vscodevim.vim
code --install-extension flowtype.flow-for-vscode
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension kamikillerto.vscode-colorize
code --install-extension rbbit.typescript-hero
code --install-extension gruntfuggly.todo-tree 

# Copy user preferences file
mv "$vscode_settings_file" "$vscode_settings_dir"
