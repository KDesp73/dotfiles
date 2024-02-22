local starter = require("project-starter")

local repos = "/home/kdesp73/personal/repos/"

local options = starter.setup({
    default_paths = {
        c = repos .. "c/",
        cpp = repos .. "cpp/",
        java = repos .. "java/",
        nvimplugin = repos .. "lua/plugins/",
        python = repos .. "python/",
        ruby = repos .. "ruby/",
        android = repos .. "android/",
    },
    cd = true, -- change project directory after creation
    jdk_app_package_name = "io.github.kdesp73"
})

