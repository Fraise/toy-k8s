build-and-deploy-all: build-all deploy-all

deploy-all: deploy-web-server deploy-super-backend

build-all: build-web-server build-super-backend

build-web-server:
	cd services/web-server && docker build -t localhost:5000/web-server:latest .
	docker image push localhost:5000/web-server:latest

deploy-web-server:
	kubectl apply -f services/web-server/infra/deployment.yaml

build-super-backend:
	cd services/super-backend && docker build -t localhost:5000/super-backend:latest .
	docker image push localhost:5000/super-backend:latest

deploy-super-backend:
	kubectl apply -f services/super-backend/infra/deployment.yaml

start-kind-cluster:
	cluster/start-kind.sh
	cluster/configure.sh

stop-kind-cluster:
	cluster/stop-kind.sh
