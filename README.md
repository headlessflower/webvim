# nvim-webdev-gruvbox

Neovim webdev profile with:
- Gruvbox theme
- Neo-tree side pane
- Telescope
- LazyGit
- Trouble
- ToggleTerm
- Treesitter
- Mason + LSP
- Vue LS + VTSLS
- DAP debugger

## Install

Unzip this folder into:

```bash
~/.config/nvim-webdev
```

Launch with:

```bash
NVIM_APPNAME=nvim-webdev nvim
```

## External tools

```bash
brew install neovim ripgrep fd lazygit fzf node stylua prettier eslint_d
npm install -g tree-sitter-cli
corepack enable
corepack prepare pnpm@latest --activate
```

## First run

```vim
:Lazy sync
:MasonInstall vue-language-server vtsls js-debug-adapter
:TSUpdate
:checkhealth
```

## Useful keys

```text
<leader>e   Explorer
-           Oil (Open parent directory)
<leader>ff  Find files
<leader>fg  Live grep
<leader>gg  LazyGit
<leader>cf  Format file
<leader>lr  Rename symbol
<leader>la  Code action
<leader>xx  Diagnostics
<leader>tf  Float terminal
F5          Debug continue
```
