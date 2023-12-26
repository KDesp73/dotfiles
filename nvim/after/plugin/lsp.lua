local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'pyright',
    'lemminx',
    'eslint',
    'rust_analyzer'
})

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

lsp.setup()
