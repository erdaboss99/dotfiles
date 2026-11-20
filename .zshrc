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
alias fs='~/.local/scripts/zellij-sessionizer.sh'
alias f="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 nvim"

# zellij (names kept from the tmux days)
alias z='zellij'
alias ta='zellij attach'
alias td='zellij action detach'
alias tl='zellij ls'
tks() { zellij kill-session "${1:-$ZELLIJ_SESSION_NAME}" && zellij delete-session "${1:-$ZELLIJ_SESSION_NAME}" 2>/dev/null; }
alias tka='zellij kill-all-sessions -y; zellij delete-all-sessions -y'
alias tkw='zellij action close-tab'
alias tkp='zellij action close-pane'
alias ts='zellij attach -c'

alias gpl='git pull'
alias gps='git push'
alias gst='git status'
alias gcm='git commit -m'
alias gsw='git switch'
alias gaa='git add -A'

alias ww="fzf_git_worktree_change_dir"
alias wwr="fzf_git_worktree_remove"
alias wwa="git_worktree_add"
alias wwt='~/.local/scripts/zellij-layout.sh'

alias report='~/.local/scripts/report.sh'
alias line-endings='~/.local/scripts/line-endings.sh'
alias new-sh='~/.local/scripts/new-sh.sh'

alias pct='npx playwright test --config="./playwright-ct.config.ts"'

alias ptr="bunx playwright show-report"
alias tsb='bunx tsc -b'

alias g='lazygit'

[ -f ~/.env.sh ] && source ~/.env.sh
[ -f ~/.local/scripts/git-worktrees.sh ] && source ~/.local/scripts/git-worktrees.sh
[ -f ~/.local/scripts/auth-wrappers.sh ] && source ~/.local/scripts/auth-wrappers.sh

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

# Dotnet
if [ -d "$HOME/dotnet" ]; then
    export DOTNET_ROOT="$HOME/dotnet"
    PATH="$HOME/dotnet:$PATH"
fi

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
  eval "$(fnm env --use-on-cd --shell zsh)"
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

# rust/cargo
# source cargo env if it exists
[ -f ~/.cargo/env ] && source ~/.cargo/env

# opencode
export PATH=/home/erdelyiroland/.opencode/bin:$PATH

# bun completions
[ -f ~/.bun/_bun ] && source ~/.bun/_bun

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export SSH_ASKPASS_REQUIRE=prefer
