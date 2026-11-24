# dotfiles

Setup for a WSL2 Ubuntu 24.04 distro.

## 1. Windows side

Run in PowerShell:

```powershell
wsl --install -d Ubuntu-24.04
winget install DEVCOM.JetBrainsMonoNerdFont
```

`%UserProfile%\.wslconfig`:

```ini
[wsl2]
networkingMode=NAT
memory=12GB
```

Windows Terminal, Ubuntu profile:

- Font: `JetBrainsMono Nerd Font`, size 11
- Color scheme: [Catppuccin Mocha](https://github.com/catppuccin/windows-terminal)
- Set as the default profile

## 2. Distro config

`/etc/wsl.conf` (run `wsl --shutdown` from Windows afterwards):

```ini
[boot]
systemd=true

[user]
default=<your-user>
```

## 3. Packages

```bash
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
  software-properties-common build-essential gcc clang make cmake \
  curl git unzip zip jq xclip wslu dos2unix shellcheck python3.12-venv \
  zsh ripgrep fd-find bat \
  gh pass gnupg pinentry-gnome3 keychain openssh-server ssh-askpass-gnome

# Debian names fd/bat differently: fd is linked here, bat is aliased in .zshrc
mkdir -p ~/.local/bin ~/.config
ln -sf "$(command -v fdfind)" ~/.local/bin/fd

# zsh as the default shell (zinit and its plugins install themselves on first start)
chsh -s "$(command -v zsh)"
```

Packages from third-party apt repos:

```bash
# Docker Engine (docker.list), then re-login for the group change
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker "$USER"

# Microsoft repo (packages-microsoft-prod), for PowerShell
curl -LO "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb
sudo apt update && sudo apt install -y powershell

# Azure CLI (azure-cli.sources)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

## 4. Clone and link

```bash
git clone git@github.com:erdaboss99/dotfiles.git ~/dotfiles
```

```bash
ln -sfn ~/dotfiles/.zshrc         ~/.zshrc
ln -sfn ~/dotfiles/.gitconfig     ~/.gitconfig
ln -sfn ~/dotfiles/.ignore        ~/.ignore       # fd/rg ignore rules
ln -sfn ~/dotfiles/.hushlogin     ~/.hushlogin    # hides the last login message
ln -sfn ~/dotfiles/scripts        ~/.local/scripts
ln -sfn ~/dotfiles/nvim           ~/.config/nvim
ln -sfn ~/dotfiles/zellij         ~/.config/zellij
ln -sfn ~/dotfiles/gh-dash        ~/.config/gh-dash
ln -sfn ~/dotfiles/starship.toml  ~/.config/starship.toml
```

Machine-specific or secret env vars (e.g. `OBSIDIAN_PATH`) go in `~/.env.sh`, which `.zshrc` sources when it exists.

## 5. Tools

```bash
# starship prompt
curl -sS https://starship.rs/install.sh | sh

# fzf (also installs the key bindings that ~/.fzf.zsh loads)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```

```bash
# zellij (prefix: Ctrl a, tmux-style binds, see zellij/cheat_sheet.md)
# v0.44+ is required for `zellij action switch-session`
curl -fsSL https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz \
  | tar xz -C ~/.local/bin
```

On first launch, approve the zjstatus permission prompt in the top bar (focus it, press `y`).

```bash
# neovim (v0.12+ is required by the config), unpacked to /opt/nvim-linux-x86_64
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64 && sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz && rm nvim-linux-x86_64.tar.gz
```

```bash
# lazygit
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | jq -r .tag_name | sed 's/^v//')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf /tmp/lazygit.tar.gz -C /tmp lazygit && sudo install /tmp/lazygit /usr/local/bin
```

### Node

```bash
curl -fsSL https://fnm.vercel.app/install | bash
fnm install --lts && fnm default lts-latest
corepack enable pnpm
npm install -g vscode-langservers-extracted   # html/css/json/eslint LSPs for nvim

# bun
curl -fsSL https://bun.sh/install | bash
```

### Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install git-delta tree-sitter-cli stylua
```

- `git-delta`: pager set in `.gitconfig`
- `tree-sitter-cli`: needed by the nvim treesitter setup

### Go

Install [Go](https://go.dev/doc/install) to `/usr/local/go`, then:

```bash
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/rhysd/actionlint/cmd/actionlint@latest
go install github.com/spf13/cobra-cli@latest
go install github.com/getsops/sops/v3/cmd/sops@latest
go install github.com/mikefarah/yq/v4@latest
```

### AI CLIs

```bash
curl -fsSL https://claude.ai/install.sh | bash      # Claude Code, ~/.local/bin/claude
curl -fsSL https://gh.io/copilot-install | bash     # GitHub Copilot CLI, ~/.local/bin/copilot
curl -fsSL https://opencode.ai/install | bash       # opencode, ~/.opencode/bin
```

### Other

- [VS Code JS debugger](https://github.com/microsoft/vscode-js-debug) (for nvim-dap)

## 6. Secrets and keys

Tokens are stored in `pass`, not in the environment:

```bash
gpg --full-generate-key
pass init <gpg-key-id>

pass insert github/wizzair    # default account
pass insert github/personal   # use with GH_ACCOUNT=personal
pass insert github/opencode-auth
pass insert personal/claude-auth-token   # from `claude setup-token`
```

`scripts/auth-wrappers.sh` wraps `gh`, `opencode`, and `claude` so they read their token from `pass` on each call.

### GPG agent

`~/.gnupg/gpg-agent.conf`:

```
default-cache-ttl 0
max-cache-ttl 0
pinentry-program /usr/bin/pinentry-gnome3
```

- `pinentry-gnome3` shows a GTK dialog through WSLg and falls back to the terminal when there is no display.
- A cache TTL of 0 means the passphrase is never cached, so every `pass show` (and so every wrapped `gh`, `claude` or `opencode` call) asks for it.

Reload after changes:

```bash
gpgconf --kill gpg-agent
```
