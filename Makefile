FORCE:

install:
	helm install --name ignite ./ignite

uninstall:
	helm delete --purge ignite

build-helm-2:
	helm template --name ignite ./ignite > ./dist/ignite.yaml

build:
	helm template ignite ./ignite > ./dist/ignite.yaml

ignite:
	kubectl exec ignite-0 --namespace=ignite -- \
		/bin/bash -c "cd /opt/ignite/apache-ignite-fabric/bin/ && \
		./control.sh --activate"
