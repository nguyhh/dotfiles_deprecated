#!/bin/bash
set -e

command_exists() {
	command -v "$@" >/dev/null 2>&1
}

# Only run nested steps in Spin workspaces.
if ! [ $SPIN ]; then
  exit 1
fi 

echo "Starting Spin setup env"

if ! command_exists zsh; then
  sudo apt-get install -y zsh
fi

if ! command_exists fzf; then
  sudo apt-get install -y fzf
fi

if [ ! -d "~/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
  ln -sf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k.zsh-theme
  cp ~/dotfiles/.p10k.zsh ~/.p10k.zsh

  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

cp ~/dotfiles/.gitconfig ~/.gitconfig
cp ~/dotfiles/.zshrc ~/.zshrc
echo "Done!!"
