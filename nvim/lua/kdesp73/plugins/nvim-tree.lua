return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional
    },
    opts = {
        sort_by = "case_sensitive",
        view = {
            width = 40,
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
    },
}
