#!/bin/bash

if [ -z ~/.zshrc ]; then
  echo "Installing Zsh..."
  sudo apt install zsh
fi

if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/oh-my-zsh/oh-my-zsh/master/tools/install.sh)"
fi

appendToCustom() {
  echo "$1" >> ~/.oh-my-zsh/custom/custom.zsh
}

if [ -z ~/.oh-my-zsh/custom/custom.zsh ]; then
  echo "Downloading main customisations file..."
  curl -fsSL "https://raw.githubusercontent.com/zaptross/custom-zsh/main/oh-my-customizations.zsh" > ~/.oh-my-zsh/custom/oh-my-customizations.zsh

  echo "Creating local customisations file..."
  echo "# Put customisations for a specific system or environment below" > ~/.oh-my-zsh/custom/oh-my-local.zsh

  echo "Configuring customizations to load..."
  appendToCustom "source ~/.oh-my-zsh/custom/oh-my-customizations.zsh"
  appendToCustom "source ~/.oh-my-zsh/custom/oh-my-local.zsh"
fi

if [ -z /usr/local/bin/direnv ]; then
  echo "Installing direnv..."
  bin_path="/usr/local/bin/"
  curl -sfL "https://direnv.net/install.sh" | bash
else
  echo "Found direnv..."
fi

echo "Configuring customizations to load..."
appendToCustom "eval \"$(/usr/local/bin/direnv hook zsh)\""

if ! dpkg -s "xsel" > /dev/null 2>&1; then
  echo "Installing xsel..."
  sudo apt-get install xsel
fi
echo "Completed setup!"