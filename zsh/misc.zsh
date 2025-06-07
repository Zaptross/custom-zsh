# Random helpers
alias ezc="code $ZSH_CUSTOM"
alias evm="vim ~/.vimrc"

function gen_passwd () {
	cat /dev/urandom | base64 | tr -dc '0-9a-zA-Z' | head -c100
}

case $(uname -s) in
	Linux)
		alias clip="xsel --clipboard"
		;;
	Darwin)
		alias clip="pbcopy"
		;;
esac