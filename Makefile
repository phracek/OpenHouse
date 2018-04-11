.PHONY: test_mtf

build:
	docker build --tag docker.io/modularitycontainers/memcached .

test_mtf: build
	mtf-generator
	MODULE=docker DOCKERFILE="./Dockerfile" mtf sanity1.py
