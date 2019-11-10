#!/bin/bash

declare script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
declare vsc_config_dir="$HOME/.config/Code/User"
mkdir -p $vsc_config_dir

if [[ ! -e $vsc_config_dir/settings.json ]]; then
  ln -s $script_dir/settings.json $vsc_config_dir/settings.json
fi

if [[ ! -e $vsc_config_dir/keybindings.json ]]; then
  ln -s $script_dir/keybindings.json $vsc_config_dir/keybindings.json
fi

# Get list of installed extensions with code --list-extensions
declare -a extensions=(
  ban.spellright
  bbenoist.togglehs
  DavidAnson.vscode-markdownlint
  foxundermoon.shell-format
  Gruntfuggly.todo-tree
  llvm-vs-code-extensions.vscode-clangd
  mrcrowl.hg
  ms-python.python
  richie5um2.vscode-sort-json
  rust-lang.rust
  vscode-icons-team.vscode-icons
  vscodevim.vim
)

for i in ${extensions[@]}; do
  code --install-extension $i &
done

declare vsc_dicts_dir="$HOME/.config/Code/Dictionaries"
mkdir -p $vsc_dicts_dir
ln -s /usr/share/hunspell/* $vsc_config_dir
ln -s $script_dir/spellright.dict $vsc_config_dir
