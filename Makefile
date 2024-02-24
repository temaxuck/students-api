PROJECT_NAME ?= students-api
PROJECT_NAMESPACE ?= temaxuck
REGISTRY_IMAGE ?= $(PROJECT_NAMESPACE)/$(PROJECT_NAME)

include .env
export

postgres: 
	docker stop $(PROJECT_NAME)-postgres || true
	docker run --rm --detach --name=$(PROJECT_NAME)-postgres \
		--env POSTGRES_USER=$(POSTGRES_USER) \
		--env POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
		--env POSTGRES_DB=$(POSTGRES_DATABASE) \
		--publish 5432:$(POSTGRES_PORT) postgres