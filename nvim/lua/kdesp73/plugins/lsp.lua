return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        local lsp_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
        end

        local has_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim-lsp")
        local capabilities = has_cmp_lsp and cmp_nvim_lsp.default_capabilities() or nil

        lsp_zero.extend_lspconfig({
            sign_text = true,
            lsp_attach = lsp_attach,
            capabilities = capabilities,
        })

        -- Setup Mason & Mason-LSPConfig safely
        require("mason").setup({})

        -- Helper function to set up LSP servers without triggering legacy lspconfig getters
        local setup_server = function(server_name, config)
            config = config or {}
            if vim.lsp.config and vim.lsp.config[server_name] then
                vim.lsp.config[server_name] = config
                vim.lsp.enable(server_name)
            else
                local ok, lspconfig = pcall(require, "lspconfig")
                if ok and lspconfig.configs and lspconfig.configs[server_name] then
                    lspconfig.configs[server_name].setup(config)
                end
            end
        end

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    setup_server(server_name)
                end,
            },
        })

        -- Autocompletion setup
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-/>"] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })

        -- Manual server setups using the non-deprecated wrapper
        setup_server("kotlin_language_server")
        setup_server("texlab")
    end,
}
