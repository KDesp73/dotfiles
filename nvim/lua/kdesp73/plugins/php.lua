return {
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                php = { { "pint", "php_cs_fixer" } },
            },
        },
    },
    {
        -- Remove phpcs linter.
        "mfussenegger/nvim-lint",
        optional = true,
        opts = {
            linters_by_ft = {
                php = {},
            },
        },
    },
    {
        -- Add the blade-nav.nvim plugin which provides Goto File capabilities
        -- for Blade files.
        "ricardoramirezr/blade-nav.nvim",
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        ft = { "blade", "php" },
    },
}

