# ${funcsourcetrace[1]%/*} is a variable that contains the path to the directory of the current script.
# The below will source all the scripts in the same directory as this script.
source ${funcsourcetrace[1]%/*}/docker.zsh
source ${funcsourcetrace[1]%/*}/git.zsh
source ${funcsourcetrace[1]%/*}/kube.zsh
source ${funcsourcetrace[1]%/*}/updeb.zsh