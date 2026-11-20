#!/usr/bin/env bash
# fzf project picker -> create-or-switch zellij session (port of tmux-sessionizer.sh)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    query=$(find ~/Work ~/Personal -mindepth 1 -maxdepth 1 -type d)$'\n'"$HOME/dotfiles"$([[ -n "$OBSIDIAN_PATH" ]] && echo $'\n'"$(realpath "$OBSIDIAN_PATH")")
    selected=$(echo "$query" | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

# Outside zellij: attach (create if missing) in the project dir
if [[ -z $ZELLIJ ]]; then
    cd "$selected" && exec zellij attach -c "$selected_name"
fi

# Inside zellij: existing sessions switch natively. `switch-session` can't create
# sessions (and can't switch to never-attached `attach -b` ones), so new sessions
# go through the zellij-switch plugin (asks for permissions on first use).
if zellij list-sessions -s -n 2>/dev/null | grep -qx "$selected_name"; then
    exec zellij action switch-session "$selected_name"
fi

ZELLIJ_SWITCH="https://github.com/mostafaqanbaryan/zellij-switch/releases/download/0.2.1/zellij-switch.wasm"
exec zellij pipe --plugin "$ZELLIJ_SWITCH" -- "--session $selected_name --cwd $selected"
