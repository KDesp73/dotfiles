return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        opts = {
            flavour = "macchiato",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = false,
            term_colors = false,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false,
            no_bold = false,
            no_underline = false,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                notify = false,
                mini = false,
            },
        },
        config = function(_, opts)
            require('catppuccin').setup(opts)
            vim.cmd('colorscheme catppuccin-macchiato')
        end,
    }
}
