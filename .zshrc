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

alias ta='tmux attach -t'
alias td='tmux detach'
alias tl='tmux ls'
alias tks='tmux kill-session'
alias tkw='tmux killw'
alias tkp='tmux killp'
alias ts='tmux new -s'

alias gpl='git pull'
alias gps='git push'
alias gst='git status'
alias gcm='git commit -m'
alias gsw='git switch'
alias gaa='git add -A'

alias ww="fzf_git_worktree_change_dir"
alias wwr="fzf_git_worktree_remove"
alias wwa="git_worktree_add"
alias wwt='~/.local/scripts/tmux-layout.sh'

alias report='~/.local/scripts/report.sh'
alias line-endings='~/.local/scripts/line-endings.sh'

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

export GPG_TTY=$(tty)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt incappendhistory

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's local bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's local scripts if it exists
if [ -d "$HOME/.local/scripts" ]; then
	PATH="$HOME/.local/scripts:$PATH"
fi

# go
PATH=$PATH:/usr/local/go/bin
if [ -d "$HOME/go/bin" ]; then
	PATH="$HOME/go/bin:$PATH"
fi

# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Dotnet tools
if [ -d "$HOME/.dotnet/tools" ]; then
	PATH="$HOME/.dotnet/tools:$PATH"
fi

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

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
