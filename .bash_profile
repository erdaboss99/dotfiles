alias vim='nvim'
alias nvimc="nvim ~/.config/nvim"
alias wf="cd ~/Work"
alias obs='cd $OBSIDIAN_PATH; clear'
alias r='source ~/.bash_profile && reset'
alias c='clear'
alias dotf='cd ~/dotfiles; clear'
alias fs='~/.local/scripts/tmux-sessionizer.sh'

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

alias ww="fzf_git_worktree_change_dir"
alias wwr="fzf_git_worktree_remove"

alias pct='npx playwright test --config="./playwright-ct.config.ts"'

alias ptr="npx playwright show-report"
alias pt='npx playwright test --config=./src/configuration/playwright.config.ts --trace=on --retries=1 --grep'
alias ptc='npx playwright test --config=./src/configuration/playwright.config.ts --trace=on --project="Desktop Chrome" --workers=1 --retries=0 --grep'
alias ptcp='npx playwright test --config=./src/configuration/playwright.config.ts --trace=on --project="Desktop Chrome" --retries=0 --grep'
alias lt='npx eslint -c eslint.config.mjs --cache --report-unused-disable-directives .'
alias lts='npx eslint -c eslint.config.mjs --cache --report-unused-disable-directives src'
alias ltt='npx eslint -c eslint.config.mjs --cache --report-unused-disable-directives tests'
alias tsb='npx tsc -b'

alias g='lazygit'

export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$HOME/go/bin"
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

[ -f ~/.local/scripts/git-worktrees.sh ] && source ~/.local/scripts/git-worktrees.sh

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!node_modules" -g "!.git" -g "!dist/"'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{node_modules}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '{node_modules}'"

# fnm
export PATH="/home/erdelyiroland/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd)"
export PATH="$PATH:/opt/nvim-linux64/bin"

[ -f ~/.env.sh ] && source ~/.env.sh

export PNPM_HOME="/home/erdelyiroland/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# starship
eval "$(starship init bash)"
