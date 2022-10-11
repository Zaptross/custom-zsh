zshCustom=~/.oh-my-zsh/custom/custom.zsh
cloneZsh=~/repos/custom-zsh

installing() {
	echo "installing $1..."
}

appendToCustom() {
	if [ -z $zshCustom ]; then
		touch $zshCustom
	fi

	echo "$1" >> $zshCustom
}

doClone() {
	git clone git@github.com:Zaptross/$1.git ~/repos/$1
}

waitForSpace() {
    read -n1 -s -r -p $'Press space to continue...\n\n' key
}

sudo apt update
sudo apt upgrade -y
sudo apt-get update

# install brave browser
installing brave-browser
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt install brave-browser -y

# install vim
installing vim
sudo apt install vim -y
sudo apt install vim-gtk3 -y
export EDITOR=vim
export VISUAL=vim

# install git
installing git
sudo apt install git-all -y

# install xsel
installing xsel
sudo apt install xsel -y

# install tmux
installing tmux
sudo apt-get install tmux -y

# install flameshot
installing flameshot
sudo apt install flameshot -y

# create a ssh key and wait for user to install it to github
echo "\n\nCreating an ssh key for use with git, assuming saved into default file...\n\n"
ssh-keygen
cat ~/.ssh/id_rsa.pub | xsel --clipboard
xdg-open "https://github.com/settings/keys"
echo "\n\nPlease add the key stored in ~/.ssh/id_rsa.pub (most likely copied to your clipboard) to your github account to allow cloning of repositories.\nWhen complete:"
waitForSpace

mkdir ~/repos
doClone custom-zsh

# install ohmyzsh
installing oh-my-zsh
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# setup my customizations
echo "Setting up customizations..."
ln "$(echo $cloneZsh)/.vimrc" ~/.vimrc
ln "$(echo $cloneZsh)/.tmux.conf" ~/.tmux.conf
appendToCustom "source $(echo $cloneZsh)/oh-my-customizations.zsh"
echo "# Put customisations for this specific system or environment below" > "$(echo $cloneZsh)/oh-my-local.zsh"
appendToCustom "source $(echo $cloneZsh)/oh-my-local.zsh"
