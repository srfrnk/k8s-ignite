FORCE:

install:
	helm install --name ignite ./ignite

uninstall:
	helm delete --purge ignite

build:
	helm install --dry-run --debug --name ignite ./ignite |\
		awk 'BEGIN {found = 0} {if (found || $$0 ~ /---/) {found = 1; print}}' > ./dist/ignite.yaml

ignite:
	kubectl exec ignite-0 --namespace=ignite -- \
		/bin/bash -c "cd /opt/ignite/apache-ignite-fabric/bin/ && \
		./control.sh --activate"
