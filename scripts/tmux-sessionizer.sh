#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	selected=$1
else
	notes_path=$(realpath "$OBSIDIAN_PATH/..")
	notes=$(find "$notes_path" -mindepth 1 -maxdepth 1 -type d)
	if [[ "$(uname)" == "Darwin" ]]; then
		# macOS
		query=$(find ~/Documents/DEV -mindepth 1 -maxdepth 1 -type d)
	elif [[ "$(uname)" == "Linux" ]]; then
		# Linux
		query=$(find ~/Work -mindepth 1 -maxdepth 1 -type d -name '*git*')
	fi
	final_query="$query"$'\n'"$notes"
	selected=$(echo "$final_query" | fzf)
fi

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
	tmux new-session -s "$selected_name" -c "$selected"
	exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
	tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
