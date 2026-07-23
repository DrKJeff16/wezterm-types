TAGS_CMD = nvim --clean --headless -c 'helptags doc/' -c 'qa!'

.PHONY: all clean distclean help helptags plugin-generate plugin-generate-check plugin-maintenance-sync plugin-maintenance-validate plugin-table plugin-table-check

all: help

help: ## Show usage
	@echo -e "Usage: make [target]\n\nAvailable targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo

helptags: ## Generate Vim help tags file
	@echo "Generating helptags..."
	@$(TAGS_CMD) > /dev/null 2>&1
	@echo

plugin-table: ## Regenerate the README plugin table
	@./scripts/plugin-maintenance.sh table

plugin-table-check: ## Verify the README plugin table is current
	@./scripts/plugin-maintenance.sh table --check

plugin-generate: ## Regenerate plugin indexes and the panvimdoc workflow
	@./scripts/plugin-maintenance.sh generate

plugin-generate-check: ## Verify generated plugin files are current
	@./scripts/plugin-maintenance.sh generate --check

plugin-maintenance-validate: ## Validate the plugin manifest, inventory, and generated files
	@./scripts/plugin-maintenance.sh validate

plugin-maintenance-sync: ## Refresh the local plugin maintenance report output
	@./scripts/plugin-maintenance.sh sync

clean: ## Clean help tags file
	@rm -rf doc/tags

distclean: clean ## Clean everything that isn't needed
	@rm -rf .ropeproject .mypy_cache

# vim: set ts=4 sts=4 sw=0 noet ai si sta:
