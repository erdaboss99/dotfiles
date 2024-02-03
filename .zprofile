eval "$(/usr/local/bin/brew shellenv)"

export OBSIDIAN_FOLDER="/Users/erdelyiroland/Library/Mobile Documents/iCloud~md~obsidian/Documents/erdelyiroland/"

alias vim='nvim'
alias nvimc='cd ~/.config/nvim; nvim .'
alias dotc='cd ~/Documents/DEV/dotfiles; nvim .'

alias fs='~/.local/scripts/tmux-sessionizer.sh'
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
alias obs='cd $OBSIDIAN_FOLDER; clear'

alias nrd='npm run dev'
alias nrb='npm run build'
alias nrs='npm run start'

alias pt='npx playwright test'
alias pts='npx playwright show-report'

alias python='python3'

alias g='lazygit'

