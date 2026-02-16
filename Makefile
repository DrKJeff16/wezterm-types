TAGS_CMD = nvim --clean --headless -c 'helptags doc/' -c 'qa!'

.PHONY: all clean distclean help helptags

all: help

help: ## Show usage
	@echo -e "Usage: make [target]\n\nAvailable targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo

helptags: ## Generate Vim help tags file
	@echo "Generating helptags..."
	@$(TAGS_CMD) > /dev/null 2>&1
	@echo

clean: ## Clean help tags file
	@rm -rf doc/tags

distclean: clean ## Clean everything that isn't needed
	@rm -rf .ropeproject .mypy_cache

# vim: set ts=4 sts=4 sw=0 noet ai si sta:
