source ${funcsourcetrace[1]%/*}/zsh/source.zsh

# Random helpers
alias clip="xsel --clipboard"
alias ezc="vim ~/repos/custom-zsh/oh-my-customizations.zsh"
alias ezl="vim ~/repos/custom-zsh/oh-my-local.zsh"
alias rzsh="source ~/.oh-my-zsh/custom/custom.zsh"
alias evm="vim ~/.vimrc"
function gen_passwd () {
	cat /dev/urandom | base64 | tr -dc '0-9a-zA-Z' | head -c100
}
