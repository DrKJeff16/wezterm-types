#!/usr/bin/env bash
#
# Create new plugin from template
#

[[ $# -eq 0 ]] && exit 1

TARGET_DIR="lua/wezterm/types/plugins"
TEMPLATE="template.lua"
TEMPLATE_DOC="template.md"
TARGET="$1"

if ! [[ -f "${TARGET_DIR}/${TARGET}.lua" ]]; then
    cp "scripts/${TEMPLATE}" "${TARGET_DIR}/${TARGET}.lua" || exit 1
fi

if ! [[ -f "docs/${TARGET}.md" ]]; then
    cp "scripts/${TEMPLATE_DOC}" "docs/${TARGET}.md" || exit 1
fi

touch "doc/wezterm-types-${TARGET}.txt"

exit 0
