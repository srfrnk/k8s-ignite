FORCE:

install:
	helm install --name ignite ./ignite

uninstall:
	helm delete --purge ignite

build-helm-2:
	helm template --name ignite ./ignite > ./dist/ignite.yaml

build: TIMESTAMP ?= $(shell date +%Y%m%d-%H%M -u)
build:
	helm template --set timestamp=${TIMESTAMP} -f ./ignite/env/stg.yaml ignite ./ignite > ./dist/ignite-${TIMESTAMP}.yaml

	@printf "\033[1;31m"
	@printf "Dist file renamed for DEBUG"
	@printf "\033[0m"
	@printf "\n"
	@mv ./dist/ignite-${TIMESTAMP}.yaml ./dist/ignite.yaml

ignite:
	kubectl exec ignite-0 --namespace=ignite -- \
		/bin/bash -c "cd /opt/ignite/apache-ignite-fabric/bin/ && \
		./control.sh --activate"
