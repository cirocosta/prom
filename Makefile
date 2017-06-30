image:
	docker build -t cirocosta/prom .

example:
	cd ./example && \
		docker-compose up

.PHONY: image example
