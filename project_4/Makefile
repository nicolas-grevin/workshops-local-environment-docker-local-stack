MAKEFILE_PATH := $(shell realpath --no-symlinks $(dir $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME := $(notdir $(MAKEFILE_PATH))_whoami

start:
	@docker run \
		--rm \
		--detach \
		--name $(PROJECT_NAME) \
		--hostname $(PROJECT_NAME) \
		--network local-stack-vnet \
		--label "traefik.enable=true" \
		--label "traefik.http.middlewares.$(PROJECT_NAME)_stripprefix.stripprefix.prefixes=/project-4/,/project-4" \
		--label "traefik.http.routers.$(PROJECT_NAME).entrypoints=http" \
		--label 'traefik.http.routers.$(PROJECT_NAME).rule=Host(`projects.docker.localhost`) && PathPrefix(`/project-4/`)' \
		--label "traefik.http.routers.$(PROJECT_NAME).middlewares=$(PROJECT_NAME)_stripprefix@docker" \
		nicolasgrevin/docker-local-stack-whoami:latest

stop:
	@docker stop $(PROJECT_NAME)

logs:
	@docker logs --follow $(PROJECT_NAME)
