COMPOSE_CMD = docker compose
LOCAL_STACK_COMPOSE = $(COMPOSE_CMD) --file local-stack/docker-compose.yaml
PROJECT_1_COMPOSE = $(COMPOSE_CMD) --file project_1/docker-compose.yaml
PROJECT_2_COMPOSE = $(COMPOSE_CMD) --file project_2/docker-compose.yaml
PROJECT_3_MAKE = $(MAKE) --silent --makefile=project_3/Makefile
PROJECT_4_MAKE = $(MAKE) --silent --makefile=project_4/Makefile

all.start: local_stack.start projects.start
all.stop: local_stack.stop projects.stop

projects.start: project_1.start project_2.start project_3.start project_4.start
projects.stop: project_1.stop project_2.stop project_3.stop project_4.stop

local_stack.start:
	@$(LOCAL_STACK_COMPOSE) up -d --force-recreate --remove-orphans

local_stack.stop:
	@$(LOCAL_STACK_COMPOSE) down --volumes --remove-orphans

local_stack.logs:
	@$(LOCAL_STACK_COMPOSE) logs --follow

project_1.start:
	@$(PROJECT_1_COMPOSE) up -d --force-recreate --remove-orphans

project_1.stop:
	@$(PROJECT_1_COMPOSE) down --volumes --remove-orphans

project_1.logs:
	@$(PROJECT_1_COMPOSE) logs --follows

project_2.start:
	@$(PROJECT_2_COMPOSE) up -d --force-recreate --remove-orphans

project_2.stop:
	@$(PROJECT_2_COMPOSE) down --volumes --remove-orphans

project_2.logs:
	@$(PROJECT_2_COMPOSE) logs --follows

project_3.start:
	@$(PROJECT_3_MAKE) start

project_3.stop:
	@$(PROJECT_3_MAKE) stop

project_3.logs:
	@$(PROJECT_3_MAKE) logs

project_4.start:
	@$(PROJECT_4_MAKE) start

project_4.stop:
	@$(PROJECT_4_MAKE) stop

project_4.logs:
	@$(PROJECT_4_MAKE) logs
