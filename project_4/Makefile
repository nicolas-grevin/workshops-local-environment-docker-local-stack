MAKEFILE_PATH := $(shell realpath --no-symlinks $(dir $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME := $(notdir $(MAKEFILE_PATH))_whoami

start:
	@docker run \
		--rm \
		--detach \
		--name $(PROJECT_NAME) \
		--hostname $(PROJECT_NAME) \
		nicolasgrevin/docker-local-stack-whoami:latest

stop:
	@docker stop $(PROJECT_NAME)

logs:
	@docker logs --follow $(PROJECT_NAME)
