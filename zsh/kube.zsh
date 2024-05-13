# Kube shortcuts
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgpa="kubectl get pods --all-namespaces"
alias kgpn="kubectl get pods -n"
alias ksn="kubectl scale -n '$1' --replicas=$2 deployments/$3"

alias watchkgpa="watch kubectl get pods --all-namespaces"

echo "Loaded kube shortcuts"