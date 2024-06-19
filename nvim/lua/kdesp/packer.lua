vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            vim.cmd('colorscheme catppuccin')
        end

    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('nvim-treesitter/playground')

    use("nvim-lua/plenary.nvim")
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use("mbbill/undotree")
    use("tpope/vim-fugitive")


    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- use {
    --     'romgrk/barbar.nvim',
    --     requires = { 'kyazdani42/nvim-web-devicons' }
    -- }

    -- Debugger
    -- 
    -- use('mfussenegger/nvim-dap')
    -- use('theHamsta/nvim-dap-virtual-text')
    -- use('nvim-telescope/telescope-dap.nvim')
    -- use('rcarriga/cmp-dap')
    -- use {
    --     "rcarriga/nvim-dap-ui",
    --     requires = { "mfussenegger/nvim-dap" }
    -- }


    -- use { -- needs configuring
    --     "ThePrimeagen/refactoring.nvim",
    --     requires = {
    --         { "nvim-lua/plenary.nvim" },
    --         { "nvim-treesitter/nvim-treesitter" }
    --     }
    -- }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }

    use {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        config = function()
        end,
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        tag = "v2.20.8",
        config = function()
            require("indent_blankline").setup {
                char = '┊',
                show_trailing_blankline_indent = false,
            }
        end,
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- use('sbdchd/neoformat')

    -- use {
    --     'jay-babu/mason-nvim-dap.nvim',
    --     requires = {
    --         { "williamboman/mason.nvim" },
    --         { "mfussenegger/nvim-dap" }
    --     }
    -- }

    use('editorconfig/editorconfig-vim')

    -- use('Microsoft/vscode-cpptools')

    -- use {
    --     "nvim-neorg/neorg",
    --     config = function()
    --         require("neorg").setup {
    --             load = {
    --                 ["core.defaults"] = {},
    --                 ["core.concealer"] = {},
    --                 ["core.dirman"] = {
    --                     config = {
    --                         workspaces = {
    --                             notes = "~/notes",
    --                         },
    --                     },
    --                 },
    --             },
    --         }
    --     end,
    --     run = ":Neorg sync-parsers",
    --     requires = "nvim-lua/plenary.nvim",
    -- }

    -- use ('rcarriga/nvim-notify')

    use "ThePrimeagen/vim-be-good"
    use "evanleck/vim-svelte"


    use "jalvesaq/Nvim-R"

    use "milisims/nvim-luaref"
    use "folke/neodev.nvim"

    use {
        "KDesp73/project-starter.nvim",
        branch = 'dev'
    }
    -- use "/home/kdesp73/personal/repos/lua/plugins/project-starter.nvim"

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use "folke/todo-comments.nvim"


    use {
        "theRealCarneiro/hyprland-vim-syntax",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = "hypr",
    }

    use 'norcalli/nvim-colorizer.lua'

    use('sophacles/vim-processing')

    use 'nvim-treesitter/nvim-treesitter-context'

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })

    use 'ray-x/go.nvim'
end)
