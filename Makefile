
include ./srcs/.env
export DOMAIN	= ${DOMAIN_NAME}

DOCKER			:= docker
DOCKER_COMPOSE	:= docker compose
WORKDIR			:= ./srcs
DATA_PATH		:= $(WORKDIR)/data
V_WORDPRESS		:= $(DATA_PATH)/wordpress
V_MARIADB		:= $(DATA_PATH)/mariadb
V_REDIS			:= $(DATA_PATH)/redis
SRC				:= $(WORKDIR)/docker-compose.yml

THIS_FILE := $(realpath $(firstword $(MAKEFILE_LIST)))

service		?=
services	?= $(service)

# hosts:
# sudo sed -i 's|localhost|$(DOMAIN)|g' /etc/hosts

.DEFAULT_GOAL := help

##
# help
# Displays a useful help screen to the user
#
# NOTE: Keep 'help' as first target in case .DEFAULT_GOAL is not honored
#
help: about targets ## This help screen
ifeq ($(CONTAINER_DEFAULT),)
	$(warning WARNING: CONTAINER_DEFAULT is not set.)
endif

about:
	@echo
	@echo "Makefile to help manage docker-compose services"

##
# Displays a list of targets, using '##' comment as target description
#
# NOTE: ONLY targets with ## comments are shown
#
targets:  ## Lists targets
	@echo
	@echo "Make targets:"
	@echo
	@cat $(THIS_FILE) | \
	sed -n -E 's/^([^.][^: ]+)\s*:(([^=#]*##\s*(.*[^[:space:]])\s*)|[^=].*)$$/    \1	\4/p' | \
	sort -u | \
	expand -t15
	@echo

##
# services
#
services: ## Lists services
	@$(DOCKER_COMPOSE) -f $(SRC) ps --services

mkdir_volumes:
	if [ ! -d "$(V_WORDPRESS)" ]; then mkdir -p "$(V_WORDPRESS)"; fi
	if [ ! -d "$(V_MARIADB)" ]; then mkdir -p "$(V_MARIADB)"; fi
	if [ ! -d "$(V_REDIS)" ]; then mkdir -p "$(V_REDIS)"; fi

rm_volumes:
	rm -rf $(DATA_PATH)

##
# build
#
build: mkdir_volumes ## Builds service images [service|services]
	@$(DOCKER_COMPOSE) -f $(SRC) build $(services)

##
# up
#
up: mkdir_volumes ## Starts containers
	@$(DOCKER_COMPOSE) -f $(SRC) up  $(services)

##
# down
#
down: ## Removes containers (preserves images and volumes)
	@$(DOCKER_COMPOSE) -f $(SRC) down

##
# rebuild
#
rebuild: down build ## Stops containers (via 'down'), and rebuilds service images (via 'build')

##
# clean
#
clean: rm_volumes stop ## Removes containers, images and volumes
	@$(DOCKER_COMPOSE) -f $(SRC) down --volumes --rmi all;
	@$(DOCKER) image prune -a -f
	

##
# start
#
start: ## Starts previously-built containers (see 'build') [service|services]
	@$(DOCKER_COMPOSE) -f $(SRC) start $(services)

##
# status
#
status: ps network volume logs ## see 'ps' 'logs' 'network' 'volume'

##
# ps
#
ps: ## Shows status of containers [service|services]
	@$(DOCKER_COMPOSE) -f $(SRC) ps $(services)

##
# images
#
images: ## List images
	@$(DOCKER_COMPOSE) -f $(SRC) images

##
# network
#
network: ## List networks
	@$(DOCKER) network ls

##
# volume
#
volume: ## List volumes
	@$(DOCKER) volume ls

##
# logs
#
logs:  ## Shows output of running containers (in 'follow' mode) [service|services]
	@$(DOCKER_COMPOSE) -f $(SRC) logs --follow $(services)

##
# stop
#
stop: ## Stops containers (without removing them) [service|services]
	@$(DOCKER_COMPOSE) -f $(SRC) stop $(services)

##
# restart
#
restart: stop start ## Stops containers (via 'stop'), and starts them again (via 'start')


.PHONY: all help hosts install build up start down rebuild re list images network logs volume

# https://medium.com/freestoneinfotech/simplifying-docker-compose-operations-using-makefile-26d451456d63
#     https://gist.github.com/iNamik/73fd1081fe299e3bc897d613179e4aee