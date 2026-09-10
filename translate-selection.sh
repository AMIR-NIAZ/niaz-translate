#!/bin/bash

ENV_FILE="$HOME/.local/bin/niaz-translate/.env"
TRANSLATE_JS="$HOME/.local/bin/niaz-translate/translater-api.js"

if [ ! -f "$ENV_FILE" ]; then
    notify-send -u critical "Translation Error" ".env file not found"
    exit 1
fi

source "$ENV_FILE"

TEXT=$(wl-paste --primary --no-newline 2>/dev/null)

if [ -z "$TEXT" ]; then
    notify-send -u normal "Translation" "No text selected"
    exit 1
fi

RESULT=$(node "$TRANSLATE_JS" "$TEXT" 2>/dev/null)

if [ -z "$RESULT" ]; then
    notify-send -u critical "Translation Error" "No response received"
    exit 1
fi

SELECTED=$(printf '%s' "Copy to clipboard" | rofi \
    -dmenu \
    -p "󰗊  Persian Translation" \
    -mesg "$RESULT" \
    -theme "$HOME/.local/bin/niaz-translate/config/translation.rasi")

if [ -n "$SELECTED" ]; then
    printf '%s' "$RESULT" | wl-copy
fi