
setopt SHARE_HISTORY
unsetopt beep
eval "$(fnm env --use-on-cd)"

source $(dirname $(gem which colorls))/tab_complete.sh

export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!node_modules" -g "!.git" -g "!dist/"'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{node_modules}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '{node_modules}'"

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
