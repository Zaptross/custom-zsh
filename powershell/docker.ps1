Set-Alias -Name d -Value docker

function dcd {
	docker compose down
}
function dcu {
	docker compose up -d
}
function dcub() {
	docker compose up -d --build $args
}

function dps {
	docker ps -a --format "table {{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Ports}}"
}

function dpsa {
    docker ps -a
}
function drm() { 
	docker stop $args
	docker rm $args
}

function dst() {
	docker start $args
}
function dstp() {
	docker stop $args
}
function dl () {
	docker logs $args
}
function dlf () {
	docker logs -f $args
}
function dsr () {
	docker stop $args
	docker rm $args
}
