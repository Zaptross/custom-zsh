# Docker shortcuts
alias d="docker"
dsc() {
  if [ ! "$(docker ps -q -f name=$1)" ]; then
    echo "Starting $1..."
    docker start $1
  fi
}
alias dcu="docker compose up -d"
alias dcub="docker compose up -d --build"
alias dcue="docker compose --env-file $1 up -d"
alias dcd="docker compose down"
alias dlf="docker logs -f "
dsr() {
	docker rm $(docker stop $1)
}

alias watchdps="watch \"docker ps --format \\\"table {{.Names}}	{{.Status}}	{{.State}}	{{.RunningFor}}\\\"\""

echo "Loaded docker shortcuts"