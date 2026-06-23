return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "c",
            "cpp",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            "rust",
            "java",
            "ruby",
            "cmake",
            "svelte",
            "html",
            "css",
            "python",
            "typescript",
            "blade",
            "php_only",
            "php",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
    config = function(_, opts)
        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        })

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }

        require("nvim-treesitter.configs").setup(opts)
    end,
}
