# nvim-config

<a href="https://dotfyle.com/KDesp73/nvim-config"><img src="https://dotfyle.com/KDesp73/nvim-config/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/KDesp73/nvim-config"><img src="https://dotfyle.com/KDesp73/nvim-config/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/KDesp73/nvim-config"><img src="https://dotfyle.com/KDesp73/nvim-config/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:KDesp73/nvim-config ~/.config/KDesp73/nvim-config
NVIM_APPNAME=KDesp73/nvim-config/ nvim --headless +"PackerSync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=KDesp73/nvim-config/ nvim
```

## Preview

![Screenshot from 2023-07-21 03-48-49](https://github.com/KDesp73/nvim-config/assets/63654361/b643734b-a79b-47cf-a28f-867e3df0a883)

## Configuration Language

[![configlang](https://skillicons.dev/icons?i=lua)](https://skillicons.dev)

## Plugins

### colorscheme

+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [navarasu/onedark.nvim](https://dotfyle.com/plugins/navarasu/onedark.nvim)

### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)

### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### debugging

+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)

### formatting

+ [sbdchd/neoformat](https://dotfyle.com/plugins/sbdchd/neoformat)
+ [elentok/format-on-save.nvim](https://dotfyle.com/plugins/elentok/format-on-save.nvim)

### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### game

+ [ThePrimeagen/vim-be-good](https://dotfyle.com/plugins/ThePrimeagen/vim-be-good)

### icon

+ [kyazdani42/nvim-web-devicons](https://dotfyle.com/plugins/kyazdani42/nvim-web-devicons)

### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

+ [jose-elias-alvarez/null-ls.nvim](https://dotfyle.com/plugins/jose-elias-alvarez/null-ls.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)

### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### markdown-and-latex

+ [ellisonleao/glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)

### marks

+ [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### note-taking

+ [nvim-neorg/neorg](https://dotfyle.com/plugins/nvim-neorg/neorg)

### nvim-dev

+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

+ [wbthomason/packer.nvim](https://dotfyle.com/plugins/wbthomason/packer.nvim)

### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### startup

+ [glepnir/dashboard-nvim](https://dotfyle.com/plugins/glepnir/dashboard-nvim)

### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### tabline

+ [romgrk/barbar.nvim](https://dotfyle.com/plugins/romgrk/barbar.nvim)

### utility

+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)

## Language Servers

+ cmake
+ eslint
+ lemminx
+ pyright
+ rust_analyzer
+ clangd


## Keymaps

`<leader>`: *Space*

| Keymap            | Functionality             |
|-------------------|---------------------------|
| `<leader>`e       | opens netrw               |
| Ctrl+s            | :w                        |
| Alt+Up            | moves line up             |
| Alt+Down          | moves line down           |
| Ctrl+Shift+Up     | copies line up            |
| Ctrl+Shift+Down   | copies line down          |
| Esc               | back to normal mode       |
| Ctrl+c            | :x                        |
| `<leader>`t       | open NvimTree             |
| `<leader>`c       | close NvimTree            |
| Alt+,             | BufferPrevious            |
| Alt+.             | BufferNext                |
| Alt+<             | BufferMovePrevious        |
| Alt+>             | BufferMoveNext            |
| Alt+<n>           | BufferGoto <n>            |
| `<leader>`gs      | open Fugitive             |
| `<leader>`a       | add file to Harpoon       |
| Ctrl+e            | open Harpoon              |
| Ctrl+q            | jump to file #1           |
| Ctrl+w            | jump to file #2           |
| Ctrl+d            | jump to file #3           |
| Ctrl+f            | jump to file #4           |
| `<leader>`sf      | find files                |
| Ctrl+p            | find git-only files       |
| `<leader>`ps      | grep files                |
| `<leader>`u       | open undotree             |
| za                | toggle neorg folds        |
| gd                | go to definition          |
| K                 | show diagnostic           |
| [d                | go to next diagnostic     |
| ]d                | go to previous diagnostic |
| `<leader>`vca     | activate code actions     |
| `<leader>`vrr     | find references           |
| `<leader>`vrn     | rename                    |
| `<leader>`h       | signature help            |
| Ctrl+l            | go to right pane          |
| Ctrl+k            | go to pane above          |
| Ctrl+j            | go to pane below          |
| Ctrl+h            | go to left pane           |
