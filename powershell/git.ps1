function sourceGit {
		. $GIT_COMMANDS_FILE
}
function gst {
		git status
}
function gstl {
	git stash list
}

function gaa {
		git add .
}
function gat {
		git add -u
}
function gapa () {
		git add --patch $args
}

function gbL {
		git branch --list --sort=-committerdate refs/heads/
}

function glc {
		param($num = 5)
				git --no-pager log --graph --decorate --oneline -n $num
}
function grl {
		param($num = 5)
				git --no-pager reflog -n $num
}
function gco () {
	$results = git branch --list --sort=-committerdate | findstr.exe $args
	if ($results.length -gt 1) {
		Write-Output "Found $($results.length) results, checking out most recent"
	}
		git checkout $(Write-Output $results | Select-Object -First 1 | ForEach-Object { $_.Trim().Replace("* ", "") })
}
function gcol ($1) {
		git checkout -
}
function gc! () {
	git commit --amend
}

function gstp {
		git stash pop
}

function gstA {
		git stash push --include-untracked
}

function gus ($1) {
		git restore --staged $1
}

function gpf {
		git push --force-with-lease
}

function grh {
		git reset
}
function grhh {
		git reset --hard
}
function grhho {
		git reset --hard origin/$(git symbolic-ref --short HEAD)
}
function gri {
		git rebase -i
}
function grp (){
	git reset --patch
}
function grhp(){
	git checkout --patch
}
function cmt ($1) {
		git commit -m $1
}
function gcnv () {
		git commit --no-verify $args
}

(Remove-Item alias:gcb -Force) 2> $null
function gcb() {
		git checkout -b $args
		[Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory("gco $args")
}

function gdh() {
		git diff HEAD $args
}
function gdc() { git diff --cached $args }
function gpsup {
		git push --set-upstream origin $(git symbolic-ref --short HEAD)
}
function current_branch() {
		git symbolic-ref --short HEAD
}
(Remove-Item alias:gl -Force) 2> $null
function gl () {
		git pull
}
(Remove-Item alias:gp -Force) 2> $null
function gp () {
		git push
}
function gbL () {
		git branch -l --sort=-committerdate
}
function gbsn () {
		return $(git branch --list | findstr $args).Trim()
}
(Remove-Item alias:gcm -Force) 2> $null
function gcm () {
	$gblResult = git branch -l --sort=-committerdate

	(Write-Output $gblResult | findstr main && git checkout main) || (Write-Output $gblResult | findstr master && git checkout master)
}

function forcePaginate() {
	param (
		[scriptblock] $action,
		[string] $fileType = ""
	)

	try {
		$fpName =  "____forcepaginate$fileType"

		& $action > $fpName
		vim $fpName
	}
	finally {
		Remove-Item $fpName
	}
}

function honeyIDroppedTheCommits() {
	param (
		[string] $search
	)

	if ($search -eq "--help") {
		echo "This function searches for a specific term in the commits that have been dropped."
		echo "Use it like this:"
		echo "            honeyIDroppedTheCommits 'search_term'"
		return
	}

	if (-not $global:hashes.length -gt 0) {
		echo "Loading hashes"
		$global:hashes = git fsck --no-reflog | select-string 'dangling commit' | foreach { $_.ToString().Split(" ")[2] }
	}

	foreach ($hash in $global:hashes) {
		$gso = git show $hash
		if ($gso -match $search) {
			echo $hash
		}
	}
}