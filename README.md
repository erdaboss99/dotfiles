# Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools

```zsh
xcode-select --install
```

2. Install Brew

[Homebrew website](https://brew.sh/)

3. Clone the repo

```zsh
# Use SSH (if set up)...
git clone git@github.com:erdaboss99/dotfiles.git ~/Documents/DEV/dotfiles
```

```zsh
# ...or use HTTPS and switch remotes later.
git clone https://github.com/erdaboss99/dotfiles.git ~/Documents/DEV/dotfiles
```

4. Install Homebrew packages from `Brewfile`.

```zsh
brew bundle
```

5. Create symlinks

```zsh
# zsh config
ln -s ~/Documents/DEV/dotfiles/.zshrc ~/.zshrc
```

```zsh
# fzf ignore
ln -s ~/Documents/DEV/dotfiles/.ignore ~/.ignore
```

```zsh
# TMUX config
# TPM is required! Install it from here https://github.com/tmux-plugins/tpm
ln -s ~/Documents/DEV/dotfiles/.tmux.conf ~/.tmux.conf
```

```zsh
# NVIM config
ln -s ~/Documents/DEV/dotfiles/nvim ~/.config/nvim
```

```zsh
# wezterm config
ln -s ~/Documents/DEV/dotfiles/.wezterm.lua ~/.wezterm.lua
```

```zsh
# starship config
ln -s ~/Documents/DEV/dotfiles/starship.toml ~/.config/starship.toml
```

```zsh
# local scripts
ln -s ~/Documents/DEV/dotfiles/scripts ~/.local/scripts
```

# Steps to bootstrap a new WSL Distribution (Ubuntu)

1. Clone the repo

```zsh
# Use SSH (if set up)...
git clone git@github.com:erdaboss99/dotfiles.git
```

```zsh
# ...or use HTTPS and switch remotes later.
git clone https://github.com/erdaboss99/dotfiles.git
```

2. Create symlinks

```zsh
# create .config folder
mkdir ~/.config
```

```zsh
# bash config
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
```

```zsh
# fzf ignore
ln -s ~/dotfiles/.ignore ~/.ignore
```

```zsh
# TMUX config
# TPM is required! Install it from here https://github.com/tmux-plugins/tpm
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

```zsh
# local scripts
ln -s ~/dotfiles/scripts ~/.local/.scripts
```

```zsh
# NVIM config
ln -s ~/dotfiles/nvim ~/.config/nvim
```

```zsh
# starship config
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```

```zsh
# hushlogin to remove the last login message
ln -s ~/dotfiles/.hushlogin ~/.hushlogin
```

3. Install apt packages

```zsh
sudo apt update && apt upgrade -y

sudo apt install software-properties-common -y

sudo add-apt-repository ppa:dotnet/backports

# If dotnet bug occurs, remove the ppa
sudo add-apt-repository --remove ppa:dotnet/backports

sudo add-apt-repository ppa:deadsnakes/ppa

sudo apt update && apt upgrade -y
```

```zsh
# install dependencies
sudo apt install unzip

sudo apt-get install ruby-full

sudo apt install ruby-rubygems

sudo apt install rbenv

sudo apt install bat

sudo apt-get install ripgrep

sudo apt-get install gcc

sudo apt-get install clang

sudo apt install dotnet-sdk-8.0

sudo apt install python3.12

sudo apt-get install python3.12-venv

```

4. Install utilities

```zsh
# python package manager
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12
```

```zsh
# fnm installer
curl -fsSL https://fnm.vercel.app/install | bash

fnm install "insert lts"

fnm use "insert lts"
```

```zsh
# starship prompt
curl -sS https://starship.rs/install.sh | sh
```

```zsh
# fzf fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install
```

```zsh
# colorls
rbenv rehash

sudo gem install colorls
```

[Lazygit git client](https://github.com/jesseduffield/lazygit)

[NeoVim installation guide](https://github.com/neovim/neovim/blob/master/INSTALL.md)

[Go installation guide](https://go.dev/doc/install)

5. Remove .bashrc

```zsh
rm ~/.bashrc
```
