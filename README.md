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
ln -s ~/Documents/DEV/dotfiles/.zprofile ~/.zprofile
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
