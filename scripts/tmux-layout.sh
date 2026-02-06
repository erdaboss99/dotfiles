#!/bin/bash

# Ensure tmux is running
if [ -z "$TMUX" ]; then
    echo "You need to run this script inside a tmux session."
    exit 1
fi

# Function to select a git worktree directory using fzf
function fzf_git_worktree_change_directory() {
    # Check if inside a git repository
    git rev-parse --is-inside-work-tree &>/dev/null || {
        echo "Not inside a git repository."
        return 1
    }

    # List git worktrees and use fzf for selection
    local worktree

    # Get worktrees and pass them through fzf for selection
    worktree=$(git worktree list | fzf --exit-0 --reverse | awk '{print $1}')

    # Check if a worktree was selected
    if [ -z "$worktree" ]; then
        echo "No worktree selected."
        return 1
    fi

    echo "$worktree"
}

# Select the git worktree directory
WORKTREE=$(fzf_git_worktree_change_directory)
if [ -z "$WORKTREE" ]; then
    echo "No worktree selected. Exiting."
    exit 1
fi

# Create tmux panes
# Split horizontally: bottom pane with 10 lines
tmux split-window -v -l 10

# Split bottom pane vertically: right pane with 2:1 ratio
tmux split-window -h -l 33%

# Navigate each pane to the selected git worktree directory
tmux select-pane -t 1 # Top pane
tmux send-keys "cd $WORKTREE;c" C-m

tmux select-pane -t 2 # Bottom-left pane
tmux send-keys "cd $WORKTREE;c" C-m

tmux select-pane -t 3 # Bottom-right pane
tmux send-keys "cd $WORKTREE;c" C-m

# Return focus to the top pane
tmux select-pane -t 1

tmux rename-window "$(basename "$WORKTREE" | tr '[:lower:]' '[:upper:]')_$(git -C "$WORKTREE" rev-parse --abbrev-ref HEAD | sed 's/[^[:alnum:]]/-/g' | tr '[:lower:]' '[:upper:]')"
