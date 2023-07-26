.PHONY: help

help:
	@echo "Make what? Target list:"
	@make -rpn | grep -E '^[a-z]+:' | awk 'BEGIN {FS = ":"}; {printf "  %s\n", $$1}' | sort

.PHONY: all
all: setup lint spelling links

.PHONY: setup
setup:
	@echo "Running $@...\n\n"
	@docker-compose run $@ checks/$@.sh
	@docker-compose down

.PHONY: lint
lint:
	@echo "Running $@...\n\n"
	@docker-compose run $@ checks/$@.sh
	@docker-compose down

.PHONY: spelling
spelling:
	@echo "Running $@...\n\n"
	@docker-compose run $@ checks/$@.sh
	@docker-compose down

.PHONY: links
links:
	@echo "Running $@...\n\n"
	@docker-compose run $@ checks/$@.sh
	@docker-compose down
