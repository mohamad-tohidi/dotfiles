# Dotfiles

Minimal dev environment setup for tmux and Neovim.

## tmux

Leader key: `Ctrl+a`

| Keybind    | Action              |
|------------|---------------------|
| `<leader>o` | Open floating opencode |
| `<leader>t` | Open floating terminal |

- Minimal status bar — no noise, just what matters

## Neovim

Built on top of [LazyVim](https://lazyvim.org).

- Minimal status bar
- [ty](https://github.com/astral-sh/ty) — Astral type checker
- [uv](https://github.com/astral-sh/uv) — Astral venv manager
- Floating scratch pad

## Install

```bash
git clone https://github.com/mohamad-tohidi/dotfiles ~/dotfiles

ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

On first `nvim` launch, LazyVim auto-installs all plugins.
