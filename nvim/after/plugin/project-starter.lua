local starter = require("project-starter")

local repos = "/home/konstantinos/personal/repos/"

local options = starter.setup({
    default_paths = {
        cpp = repos .. "cpp/",
        java = repos .. "java/",
        nvim_plugins = repos .. "lua/plugins/",
        python = repos .. "python/",
        ruby = repos .. "ruby/",
    },
    cd = true, -- change project directory after creation
})
