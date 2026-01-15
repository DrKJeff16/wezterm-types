TAGS_CMD = nvim --clean --headless -c 'helptags doc/' -c 'qa!'

.PHONY: all clean helptags

all: helptags

helptags:
	@echo -e "Generating helptags...\n"
	@$(TAGS_CMD) > /dev/null 2>&1

clean:
	@rm -rf doc/tags

distclean: clean
	@rm -rf .ropeproject .mypy_cache

# vim: set ts=4 sts=4 sw=0 noet ai si sta:
