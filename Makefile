CMD = nvim --clean --headless

TAGS_CMD = $(CMD) -c 'helptags doc/' -c 'qa!'

.SUFFIXES:

.PHONY: \
	all \
	clean \
	helptags

all:
	@$(MAKE) helptags

helptags:
	@echo -e "\nGenerating helptags...\n"
	@$(TAGS_CMD) > /dev/null 2>&1
	@echo

clean:
	@rm -rf doc/tags

distclean: clean
	@rm -rf .ropeproject .mypy_cache
# vim: set ts=4 sts=4 sw=0 noet ai si sta:
