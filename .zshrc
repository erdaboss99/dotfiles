# zinit zsh plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# load completions
autoload -Uz compinit && compinit

# aliases
alias vim='nvim'
alias wf="cd ~/Work"
alias obs='cd $OBSIDIAN_PATH; clear'
alias r='source ~/.zshrc && reset'
alias c='clear'
alias dotf='cd ~/dotfiles; clear'
alias bat='batcat'
alias fs='~/.local/scripts/tmux-sessionizer.sh'
alias f="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 nvim"
alias ls='colorls'

alias ta='tmux attach -t'
alias td='tmux detach'
alias tl='tmux ls'
alias tks='tmux kill-session'
alias tkw='tmux killw'
alias ts='tmux new -s'

alias ww="fzf_git_worktree_change_dir"
alias wwr="fzf_git_worktree_remove"
alias wwa="git_worktree_add"
alias wwt='~/.local/scripts/tmux-layout.sh'

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

[ -f ~/.env.sh ] && source ~/.env.sh
[ -f ~/.local/scripts/git-worktrees.sh ] && source ~/.local/scripts/git-worktrees.sh

export EDITOR='nvim'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private scripts if it exists
if [ -d "$HOME/.local/scripts" ]; then
	PATH="$HOME/.local/scripts:$PATH"
fi

# go
export PATH="$PATH:/usr/local/go/bin"
if [ -d "$HOME/go/bin" ]; then
	PATH="$HOME/go/bin:$PATH"
fi

# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!node_modules" -g "!.git" -g "!dist/"'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{node_modules}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '{node_modules}'"

# fnm
FNM_PATH="/home/erdelyiroland/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/erdelyiroland/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# starship
eval "$(starship init zsh)"

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# pnpm
export PNPM_HOME="/Users/erdelyiroland/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
