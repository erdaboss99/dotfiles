#!/usr/bin/env bash
# fzf git worktree picker -> new tab with the 4-pane worktree layout (port of tmux-layout.sh)
# Layout: ~/dotfiles/zellij/layouts/worktree.kdl

if [[ -z $ZELLIJ ]]; then
    echo "You need to run this script inside a zellij session."
    exit 1
fi

git rev-parse --is-inside-work-tree &>/dev/null || {
    echo "Not inside a git repository."
    exit 1
}

WORKTREE=$(git worktree list | fzf --exit-0 --reverse | awk '{print $1}')
if [[ -z $WORKTREE ]]; then
    echo "No worktree selected. Exiting."
    exit 1
fi

NAME="$(basename "$WORKTREE" | tr '[:lower:]' '[:upper:]')_$(git -C "$WORKTREE" rev-parse --abbrev-ref HEAD | sed 's/[^[:alnum:]]/-/g' | tr '[:lower:]' '[:upper:]')"

zellij action new-tab --layout worktree --cwd "$WORKTREE" --name "$NAME" >/dev/null
