return {
    "lervag/vimtex",
    lazy = false,
    tag = "v2.15",
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
            options = {
                "-shell-escape",
                "-quiet",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
    end
}
