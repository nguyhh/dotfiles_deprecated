#!/bin/bash
# Only run nested steps in Spin workspaces.
if [[ "$SPIN" = 1 ]]
then
  cp "$PWD/dotfiles/gitconfig" ~/.gitconfig
  cp "$PWD/dotfiles/zshrc" ~/.zshrc
fi
