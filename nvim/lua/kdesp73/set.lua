local vim = vim

vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false;
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.wildignore = "*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.mouse= ""

-- EditorConfig Format on save
function loadAndEdit()
    vim.cmd('EditorConfigReload')
    vim.cmd('e')
end

-- vim.cmd([[
-- augroup EditorConfigAutoReload
-- autocmd!
-- autocmd BufWritePost *.cpp, *.h, *.hpp lua ReloadAndEdit()
-- augroup END
-- ]])

vim.cmd [[
augroup RubyAutocommands
autocmd!
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
augroup END
]]


