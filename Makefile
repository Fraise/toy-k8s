deploy-all: deploy-web-server

build-web-server:
	cd services/web-server && docker build -t localhost:5000/web-server:latest .
	docker image push localhost:5000/web-server:latest

deploy-web-server:
	kubectl apply -f services/web-server/infra/deployment.yaml

start-cluster:
	cluster/start.sh

stop-cluster:
	kind delete cluster
	cluster/stop.sh