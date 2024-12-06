#!/bin/bash

function is_in_git_repo() {
	git rev-parse HEAD >/dev/null 2>&1
}

function fzf_git_worktree_change_dir() {
	is_in_git_repo || return

	local worktrees
	local worktree
	local query
	local sess_arr
	local retval
	worktrees=$(git worktree list | fzf --exit-0 --print-query --reverse)
	retval=$?

    IFS=$'\n' sess_arr=(${(f)worktrees})

	worktree=$(echo ${sess_arr[1]} | awk '{print $1}')
	query=${sess_arr[0]}

    if [ $retval = 0 ]; then  # Single = for comparison
		if [ "$worktree" = "" ]; then  # Single = for comparison
			worktree=$(echo "$query" | awk '{print $1}')
		fi
		cd "$worktree"
	elif [ $retval == 1 ]; then
		DEFAULT_GIT_FOLDER=$(git worktree list | head --lines 1 | awk '{print $1}')

		mkdir $DEFAULT_GIT_FOLDER/.worktrees

		git worktree add $DEFAULT_GIT_FOLDER/.worktrees/"$query"

		cd $DEFAULT_GIT_FOLDER/.worktrees/"$query"

		git branch "$query"
		git checkout "$query"
	fi
}

function fzf_git_worktree_remove() {
	is_in_git_repo || return

	WORKTREE=$(git worktree list | fzf | awk '{print $1}')
	DEFAULT_GIT_FOLDER=$(git worktree list | head --lines 1 | awk '{print $1}')

	git worktree remove $WORKTREE --force &>/dev/null
	cd $DEFAULT_GIT_FOLDER
}

function git_worktree_add() {
	is_in_git_repo || return

	local worktree_name=$1
	if [ -z "$worktree_name" ]; then
		echo "Usage: git_worktree_add <worktree-name>"
		return 1
	fi

	local worktree_dir="./$worktree_name"

	if [ -d "$worktree_dir" ]; then
		echo "Worktree directory '$worktree_dir' already exists."
		return 1
	fi

	git worktree add "$worktree_dir"

    local source_env="./playwright.env"
    local target_env="$worktree_dir/playwright.env"

    if [ ! -f "$source_env" ]; then
        echo "Warning: '$source_env' does not exist. Symlink not created."
    else
        local relative_path
        relative_path=$(realpath --relative-to="$worktree_dir" "$source_env" 2>/dev/null)

        if [ -z "$relative_path" ]; then
            relative_path="$source_env"
        fi

        echo "Creating symlink for env file at in $target_env"
        ln -s "$relative_path" "$target_env"
        if [ $? -ne 0 ]; then
            echo "Warning: Failed to create symlink for playwright.env."
        fi
    fi

    (
        cd "$worktree_dir" || { echo "Error: Cannot change directory to '$worktree_dir'."; exit 1; }
        if [ -f package.json ]; then
            echo "Running 'npm ci' in '$worktree_dir'..."
            npm ci
            if [ $? -ne 0 ]; then
                echo "Warning: 'npm ci' failed in '$worktree_dir'."
            fi
        else
            echo "Warning: No package.json found in '$worktree_dir'. Skipping 'npm ci'."
        fi
    )

    cd "$worktree_dir" || { echo "Error: Unable to change directory to '$worktree_dir'."; return 1; }
}
