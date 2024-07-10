alias vim='nvim'
alias nvimc="nvim ~/.config/nvim"
alias wf="cd ~/Work/autotest-playwright"
alias r='reset'
alias c='clear'

alias bat='batcat'
alias ls='colorls'
alias f="fzf --preview 'batcat --style=numbers --color=always {}' | xargs -n 1 nvim"
alias zif='find . -name "*Zone.Identifier" -type f -delete'
alias report='~/.local/scripts/report.sh'

alias ta='tmux attach -t'
alias td='tmux detach'
alias tl='tmux ls'
alias tk='tmux kill-session'
alias ts='tmux new -s'

alias ptr="npx playwright show-report"
alias pte='npx playwright test --config=./src/configuration/playwright.e2e.config.ts --retries=0 --grep'
alias pts='npx playwright test --config=./src/configuration/playwright.system.config.ts --retries=0 --grep'
alias ptec='npx playwright test --config=./src/configuration/playwright.e2e.config.ts --project="Desktop Chrome" --retries=0 --grep'
alias ptsc='npx playwright test --config=./src/configuration/playwright.system.config.ts --project="Desktop Chrome" --retries=0 --grep'
alias ptecp='npx playwright test --config=./src/configuration/playwright.e2e.config.ts --project="Desktop Chrome" --workers=1 --retries=0 --grep'
alias ptscp='npx playwright test --config=./src/configuration/playwright.system.config.ts --project="Desktop Chrome" --workers=1 --retries=0 --grep'
alias lts='npx eslint -c .eslintrc.json --ext .ts src'
alias ltt='npx eslint -c .eslintrc.json --ext .ts tests'

alias g='lazygit'

export OBSIDIAN_PATH='/mnt/c/Users/rerdelyi/iCloudDrive/iCloud~md~obsidian/erdelyiroland'
export PATH=$PATH:/usr/local/go/bin
export GOPATH=~/go
export PATH="$PATH:$HOME/.dotnet/tools"

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# fzf
source /usr/share/doc/fzf/examples/key-bindings.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!node_modules" -g "!.git" -g "!dist/"'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{node_modules}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '{node_modules}'"

# fnm
export PATH="/home/erdelyiroland/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd)"
export PATH="$PATH:/opt/nvim-linux64/bin"

# starship
eval "$(starship init bash)"
