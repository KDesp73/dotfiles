require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    sync_root_with_cwd = true,
    renderer = {
        group_empty = true,
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true
            }
        }
    },
})

vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>τ", vim.cmd.NvimTreeOpen)
vim.keymap.set("n", "<leader>c", vim.cmd.NvimTreeClose)
vim.keymap.set("n", "<leader>ψ", vim.cmd.NvimTreeClose)


