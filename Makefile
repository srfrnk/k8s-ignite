FORCE:

build: TIMESTAMP ?= $(shell date +%Y%m%d-%H%M -u)
build: FORCE
	helm template --set timestamp=${TIMESTAMP} -f ./ignite-chart/env/dev.yaml ignite ./ignite-chart > ./dist/ignite-${TIMESTAMP}.yaml

	@printf "\033[1;31m"
	@printf "Dist file renamed for DEBUG"
	@printf "\033[0m"
	@printf "\n"
	@mv ./dist/ignite-${TIMESTAMP}.yaml ./dist/ignite.yaml

activate: FORCE
	kubectl exec ignite-0 --namespace=ignite -- \
		/bin/bash -c "cd /opt/ignite/apache-ignite-fabric/bin/ && \
		./control.sh --activate"

start-proxy: FORCE
	kubectl port-forward -n ignite svc/ignite 8080:8080 10800:10800 10900:10900
