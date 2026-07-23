#!/usr/bin/env bash

is_in_git_repo() {
    git rev-parse HEAD >/dev/null 2>&1
}

fzf_git_worktree_change_dir() {
    is_in_git_repo || return

    local worktrees
    local worktree
    local query
    local sess_arr
    local retval
    worktrees=$(git worktree list | fzf --exit-0 --print-query --reverse)
    retval=$?

    query=$(echo "$worktrees" | sed -n '1p')
    worktree=$(echo "$worktrees" | sed -n '2p' | awk '{print $1}')

    if [ "$retval" = 0 ]; then
        if [ -z "$worktree" ]; then
            worktree=$(echo "$query" | awk '{print $1}')
        fi
        cd "$worktree" || return
    elif [ "$retval" = 1 ]; then
        local default_git_folder
        default_git_folder=$(git worktree list | head --lines 1 | awk '{print $1}')

        mkdir -p "$default_git_folder/.worktrees"

        git worktree add "$default_git_folder/.worktrees/$query"

        cd "$default_git_folder/.worktrees/$query" || return

        git branch "$query"
        git checkout "$query"
    fi
}

fzf_git_worktree_remove() {
    is_in_git_repo || return

    local worktree
    local default_git_folder
    worktree=$(git worktree list | fzf | awk '{print $1}')
    default_git_folder=$(git worktree list | head --lines 1 | awk '{print $1}')

    git worktree remove "$worktree" --force &>/dev/null
    cd "$default_git_folder" || return
}

git_worktree_add() {
    is_in_git_repo || return

    local worktree_name=$1
    if [ -z "$worktree_name" ]; then
        echo "Usage: git_worktree_add <worktree-name>"
        return 1
    fi

    if [[ "$worktree_name" == */* || "$worktree_name" == *\\* ]]; then
        echo "Error: Worktree name must not contain path separators."
        return 1
    fi

    local parent_dir
    parent_dir=$(git worktree list --porcelain | head -1 | cut -d' ' -f2)

    if [ -z "$parent_dir" ]; then
        echo "Error: Could not determine main worktree directory."
        return 1
    fi

    local worktree_dir="$parent_dir/$worktree_name"

    if [ -d "$worktree_dir" ]; then
        echo "Worktree directory '$worktree_dir' already exists."
        return 1
    fi

    git worktree add --detach "$worktree_dir" HEAD

    local source_env="$parent_dir/playwright.env"
    local target_env="$worktree_dir/playwright.env"

    if [ ! -f "$source_env" ]; then
        echo "Warning: '$source_env' does not exist. Symlink not created."
    else
        local relative_path
        relative_path=$(realpath --relative-to="$worktree_dir" "$source_env" 2>/dev/null)

        if [ -z "$relative_path" ]; then
            relative_path="$source_env"
        fi

        echo "Creating symlink for env file at $target_env"
        if ! ln -sf "$relative_path" "$target_env"; then
            echo "Warning: Failed to create symlink for playwright.env."
        fi
    fi

    (
        cd "$worktree_dir" || {
            echo "Error: Cannot change directory to '$worktree_dir'."
            exit 1
        }
        if [ -f package.json ]; then
            echo "Running 'pnpm i' in '$worktree_dir'..."
            if ! pnpm i; then
                echo "Warning: 'pnpm i' failed in '$worktree_dir'."
            fi
        else
            echo "Warning: No package.json found in '$worktree_dir'. Skipping 'pnpm i'."
        fi
    )

    cd "$worktree_dir" || {
        echo "Error: Unable to change directory to '$worktree_dir'."
        return 1
    }
}
