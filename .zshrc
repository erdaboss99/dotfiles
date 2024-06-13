export OBSIDIAN_PATH="/Users/erdelyiroland/Library/Mobile Documents/iCloud~md~obsidian/Documents/erdelyiroland/"

alias vim='nvim'
alias nvimc='cd ~/.config/nvim; nvim .'
alias dotc='cd ~/Documents/DEV/dotfiles; nvim .'

alias fs='~/.local/scripts/tmux-sessionizer.sh'
alias beye='~/Documents/DEV/go-beye/beye'
alias f="fzf --preview 'bat --style=numbers --color=always {}' | xargs -n 1 nvim"
alias c='clear'
alias ls='colorls'
alias r='source ~/.zshrc; clear'
alias tt='tree -a -I 'node_modules' -I '.git' -I '.next' -I '.DS_Store''
alias grp='grep --colour=auto'

alias ta='tmux attach -t'
alias td='tmux detach'
alias tl='tmux ls'
alias tk='tmux kill-session'
alias ts='tmux new -s'

alias dev='cd ~/Documents/DEV/; clear'
alias dl='cd ~/Downloads/; clear'
alias dot='cd ~/Documents/DEV/dotfiles/; clear'
alias obs='cd $OBSIDIAN_PATH; clear'

alias nrd='npm run dev'
alias nrb='npm run build'
alias nrs='npm run start'

alias pt='npx playwright test'
alias pts='npx playwright show-report'

alias python='python3'

alias g='lazygit'


setopt SHARE_HISTORY
unsetopt beep
eval "$(fnm env --use-on-cd)"

source $(dirname $(gem which colorls))/tab_complete.sh

export PATH="$PATH:/Users/erdelyiroland/.dotnet/tools"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!node_modules" -g "!.git" -g "!dist/"'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{node_modules}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '{node_modules}'"

eval "$(/usr/local/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

export PATH="$PATH:/Users/erdelyiroland/go/bin"

# pnpm
export PNPM_HOME="/Users/erdelyiroland/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
