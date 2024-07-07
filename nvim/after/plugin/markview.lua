equire("markview").setup({
    buf_ignore = { "nofile" },
    modes = { "n" },

    -- Returns the conceallevel to the global value when changing modes
    restore_conceallevel = true,
    -- Returns the concealcursor to the global value when changing modes
    restore_concealcursor = false,

    headings = {},
    code_blocks = {},
    block_quotes = {},
    horizontal_rules = {},
    hyperlinks = {},
    images = {},
    inline_codes = {},
    list_items = {},
    checkboxes = {},
    tables = {}
});
