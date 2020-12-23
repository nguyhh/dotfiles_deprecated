#!/usr/bin/env bash

# Install Homebrew (if not installed)
echo "Installing Homebrew."

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"


brew install gmp
brew install grep
brew install node

# Install useful binaries.
brew install git
brew install tree
brew install fzf

# Installs Casks
brew tap caskroom/cask

## Apps I use
brew cask install 1password
brew cask install homebrew/cask-versions/firefox-nightly # Nightly
brew cask install google-chrome #Chrome
brew cask install iterm2
brew cask install slack
brew cask install spotify
brew cask install visual-studio-code
brew install neovim

# Remove outdated versions from the cellar.
brew cleanup
