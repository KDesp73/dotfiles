return {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {                            -- Optional
            "williamboman/mason.nvim",
            run = function()
                pcall(vim.cmd, "MasonUpdate")
            end,
        },
        { "williamboman/mason-lspconfig.nvim" }, -- Optional

        -- Autocompletion
        { "hrsh7th/nvim-cmp" }, -- Required
        { "hrsh7th/cmp-nvim-lsp" }, -- Required
        { "L3MON4D3/LuaSnip" }, -- Required
    },
    config = function ()
        local lsp = require('lsp-zero')
        local lspconfig = require('lspconfig')

        lsp.preset('recommended')

        -- lsp.ensure_installed({
        --     'arduino_language_server',
        --     'ast_grep',
        --     'bashls',
        --     -- 'clang-format',
        --     'clangd',
        --     'cmake',
        --     -- 'cmakelang',
        --     -- 'cmakelint',
        --     -- 'codelldb',
        --     -- 'cpplint',
        --     -- 'cpptools',
        --     'cssls',
        --     'denols',
        --     'emmet_ls',
        --     'eslint',
        --     'grammarly',
        --     'gradle_ls',
        --     'html',
        --     -- 'java-debug-adapter',
        --     -- 'java-test',
        --     'jdtls',
        --     'lemminx',
        --     'lua_ls',
        --     -- 'markdownlint',
        --     'marksman',
        --     -- 'prettier',
        --     -- 'prettierd',
        --     -- 'pylint',
        --     'pyright',
        --     'pylsp',
        --     'r_language_server',
        --     'rubocop',
        --     -- 'ruby_ls',
        --     -- 'rubyfmt',
        --     'rust_analyzer',
        --     -- 'shellcheck',
        --     'solargraph',
        --     'svelte',
        --     -- 'xmlformatter',
        -- })

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<C-/>'] = cmp.mapping.complete()
        })

        lsp.setup_nvim_cmp({
            mapping = cmp_mappings
        })

        lsp.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opt)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opt)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opt)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opt)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opt)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opt)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opt)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opt)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opt)
            vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, opt)
        end)

        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {
                            'vim',
                            'require'
                        },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

        lsp.setup()

        require'lspconfig'.kotlin_language_server.setup{}
        require'lspconfig'.texlab.setup{}

    end
}

