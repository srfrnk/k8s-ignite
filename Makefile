FORCE:

build: TIMESTAMP ?= $(shell date +%Y%m%d-%H%M -u)
build: FORCE
	helm template ignite ./ignite-chart --set timestamp=${TIMESTAMP} -f ./ignite-chart/env/minikube.yaml > ./dist/ignite-minikube-${TIMESTAMP}.yaml
	mv ./dist/ignite-minikube-${TIMESTAMP}.yaml ./dist/ignite-minikube.yaml
	@printf "\033[1;31m"
	@printf "Dist file renamed for DEBUG"
	@printf "\033[0m"
	@printf "\n"

set-registry-secrets:
	kubectl create secret generic -n ignite regcred \
		--from-file=.dockerconfigjson=${HOME}/.docker/config.json \
		--type=kubernetes.io/dockerconfigjson

	kubectl create secret generic -n ignite-web-console regcred \
		--from-file=.dockerconfigjson=${HOME}/.docker/config.json \
		--type=kubernetes.io/dockerconfigjson


activate: FORCE
	kubectl exec ignite-0 --namespace=ignite -- \
		/bin/bash -c "cd /opt/ignite/apache-ignite-fabric/bin/ && \
		./control.sh --activate"

start-proxy: FORCE
	kubectl port-forward -n ignite svc/ignite 8080:8080 10800:10800 10900:10900
