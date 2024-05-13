# Git shortcuts
alias cmt="git commit -m"
alias gbDa="git branch -D $(git branch --list $1)"
alias gbL="git branch -l --sort=-committerdate"
alias gbR="git branch -r"
alias gdh="git diff HEAD"
alias gdf="git diff HEAD | grep \"^[+-][^\n]\""
alias gdc="git diff --staged HEAD"
glc() { git --no-pager log --graph --decorate --oneline -n ${1:-5} }
alias gri="git rebase -i $2 --onto $1"
alias gsc="git diff --cached | grep \"^[+-][^\n]\""
alias gstA="git add . && git stash push"
alias cgst="clear && git status"
alias gus="git restore --staged $1"
alias pull="git pull"
alias gcmp="gcm && git pull"

# Open a new PR for the current branch on the remote repository
# Note: assumes using GitHub via SSH
ghpr() {
 	ghpr_branch_name="$(git rev-parse --abbrev-ref HEAD)"
  ghpr_repo_name="$(git remote get-url origin | sed 's/.*://' | sed 's/.git//')"
	xdg-open "https://github.com/$ghpr_repo_name/pull/new/$ghpr_branch_name" > /dev/null
}

echo "Loaded git shortcuts"