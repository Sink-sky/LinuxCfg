#!/bin/bash

if [ -d "$HOME/.oh-my-zsh" ]; then
	rm -rf ~/.oh-my-zsh
fi
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

zsh_custom_path="${ZSH_CUSTOM:-"$HOME"/.oh-my-zsh/custom}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$zsh_custom_path"/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions "$zsh_custom_path"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$zsh_custom_path"/plugins/zsh-syntax-highlighting

script_path=$(readlink -f "$0")
work_path=$(dirname "$script_path")
cp "$work_path"/../zshrc ~/.zshrc

chsh -s /bin/zsh
