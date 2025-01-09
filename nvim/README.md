# dotfiles/nvim

<a href="https://dotfyle.com/KDesp73/dotfiles-nvim"><img src="https://dotfyle.com/KDesp73/dotfiles-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/KDesp73/dotfiles-nvim"><img src="https://dotfyle.com/KDesp73/dotfiles-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/KDesp73/dotfiles-nvim"><img src="https://dotfyle.com/KDesp73/dotfiles-nvim/badges/plugin-manager?style=flat" /></a>


## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:KDesp73/dotfiles ~/.config/KDesp73/dotfiles
NVIM_APPNAME=KDesp73/dotfiles/nvim nvim --headless +"PackerSync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=KDesp73/dotfiles/nvim nvim
```

## Plugins

### colorscheme

+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
### comment

+ [numToStr/Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### editing-support

+ [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
### file-explorer

+ [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)
+ [nvim-tree/nvim-tree.lua](https://dotfyle.com/plugins/nvim-tree/nvim-tree.lua)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### golang

+ [ray-x/go.nvim](https://dotfyle.com/plugins/ray-x/go.nvim)
### icon

+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
+ [echasnovski/mini.icons](https://dotfyle.com/plugins/echasnovski/mini.icons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [VonHeikemen/lsp-zero.nvim](https://dotfyle.com/plugins/VonHeikemen/lsp-zero.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### markdown-and-latex

+ [MeanderingProgrammer/render-markdown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/render-markdown.nvim)
+ [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
### marks

+ [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)
### nvim-dev

+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
+ [milisims/nvim-luaref](https://dotfyle.com/plugins/milisims/nvim-luaref)
+ [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
+ [wbthomason/packer.nvim](https://dotfyle.com/plugins/wbthomason/packer.nvim)
### project

+ [KDesp73/project-starter.nvim](https://dotfyle.com/plugins/KDesp73/project-starter.nvim)
### snippet

+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
### utility

+ [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
## Language Servers

+ arduino_language_server
+ bashls
+ clangd
+ cmake
+ cssls
+ denols
+ emmet_ls
+ eslint
+ gradle_ls
+ grammarly
+ html
+ jdtls
+ lemminx
+ lua_ls
+ marksman
+ pylsp
+ pyright
+ r_language_server
+ ruby_ls
+ rust_analyzer
+ solargraph
+ svelte

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
