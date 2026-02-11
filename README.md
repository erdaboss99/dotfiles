# Steps to bootstrap a new WSL Distribution (Ubuntu)

1. Clone the repo

```bash
git clone git@github.com:erdaboss99/dotfiles.git
```

2. Create symlinks

```bash
# create .config folder
mkdir ~/.config
```

```bash
# bash config
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

```bash
# fzf ignore
ln -s ~/dotfiles/.ignore ~/.ignore
```

```bash
# TMUX config
# TPM is required! Install it from here https://github.com/tmux-plugins/tpm
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

```bash
# local scripts
ln -s ~/dotfiles/scripts ~/.local/scripts
```

```bash
# NVIM config
ln -s ~/dotfiles/nvim ~/.config/nvim
```

```bash
# starship config
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```

```bash
# hushlogin to remove the last login message
ln -s ~/dotfiles/.hushlogin ~/.hushlogin
```

3. Install apt packages

```bash
sudo apt update && apt upgrade -y

sudo apt install software-properties-common -y

sudo apt update && apt upgrade -y

# Change default shell to ZSH
sudo apt install zsh
chsh -s /bin/zsh
```

```bash
# install dependencies
sudo apt install unzip

sudo apt install xclip

sudo apt install fd-find

sudo apt install bat

sudo apt-get install ripgrep

sudo apt-get install gcc

sudo apt-get install clang

sudo apt install dotnet-sdk-8.0

```

4. Install utilities

```bash
# fnm installer
curl -fsSL https://fnm.vercel.app/install | bash

fnm install "insert lts"

fnm use "insert lts"
```

```bash
# starship prompt
curl -sS https://starship.rs/install.sh | sh
```

```bash
# fzf fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install
```

[Lazygit git client](https://github.com/jesseduffield/lazygit)

[Nvim installation guide](https://github.com/neovim/neovim/blob/master/INSTALL.md)

> note: v0.12+ is required for the config to work

[Vs Code JavaScript Debug](https://github.com/microsoft/vscode-js-debug#)

[Go installation guide](https://go.dev/doc/install)

[Rust installation guide](https://rust-lang.org/tools/install/)

[Tree-Sitter](https://github.com/tree-sitter/tree-sitter)
