# Docker shortcuts
alias d="docker"
dsc() {
  if [! "$(docker ps -q -f name=$1)" ]; then
    echo "Starting $1..."
    docker start $1
  fi
}
alias dcu="docker-compose up -d"
alias dcue="docker-compose --env-file $1 up -d"
alias dcd="docker-compose down"

# Git shortcuts
alias cmt="git commit -m"
alias gbDa="git branch -D `git branch --list $1`"
alias gbL="git branch -l"
alias gbR="git branch -r"
gbcT() {
	read "branchName?Describe temp branch to create: " && git checkout -b "temp/$branchName"
	resetCommitHash="$(git rev-parse --short HEAD)"
	rsT() { git reset --hard $resetCommitHash }
}
alias gco="git checkout `git branch --list | grep $1`"
gcuT() {
	gbDa "temp/*" &&
	rsT() { echo "Branch reset command has been cleaned up." }
}
alias gdf="git diff HEAD $1"
alias gdh="git diff HEAD | grep \"^[+-][^\n]\""
glc() { git --no-pager log --oneline -n ${1:-5} }
alias gri="git rebase -i $2 --onto $1"
alias gsc="git diff --cached | grep \"^[+-][^\n]\""
alias gstA="git add . && git stash push"
alias gus="git restore --staged $1"
alias pull="git pull"

# Kube shortcuts
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgpa="kubectl get pods --all-namespaces"
alias kgpn="kubectl get pods -n"
alias ksn="kubectl scale -n '$1' --replicas=$2 deployments/$3"

# Cool status helpers
alias watchdps="watch \"docker ps --format \\\"table {{.Names}}	{{.Status}}	{{.State}}	{{.RunningFor}}\\\"\""
alias watchkgpa="watch kubectl get pods --all-namespaces"

# Random helpers
alias clip="xsel --clipboard"
alias ezsh="vim ~/.oh-my-zsh/custom/oh-my-customizations.zsh"
alias rzsh="source ~/.oh-my-zsh/custom/custom.zsh"
