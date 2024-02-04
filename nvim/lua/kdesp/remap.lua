local vim = vim

local map = vim.keymap.set


map("n", "<leader>e", vim.cmd.Ex)
map("n", "<leader>ε", vim.cmd.Ex)

vim.api.nvim_set_keymap("n", "<leader>sx", ":w<CR>:source %<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-s>", ":w!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-σ>", ":w!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w!<CR>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-σ>", "<Esc>:w!<CR>a", { noremap = true, silent = true })

-- Remap Ctrl+C to Esc
vim.api.nvim_set_keymap('n', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '<Esc>', { noremap = true, silent = true })

-- Remap Esc to vim.cmd.BufferClose
vim.api.nvim_set_keymap('n', '<Esc>', ':lua vim.cmd("BufferClose")<CR>', { noremap = true, silent = true })
-- delete text but don't copy to clipboard
map({ "n", "v" }, "<leader>d", [["_d]])
-- paste text but DONT copy the overridden text
map("x", "p", [["_dP]])

-- Quit
map("n", "<leader>qw", ":qw<CR>", { desc = "Save & quit" })
map("n", "<leader>wq", ":qw<CR>", { desc = "Save & quit" })
map("n", "<leader>q!", ":q!<CR>", { desc = "Quit all buffer without save" })
map("n", "<leader>q1", ":q!<CR>", { desc = "Quit all buffer without save" })
map("n", "<leader>qq", ":q<CR>", { desc = "Quit buffer without save" })
map("n", "<leader>qa", ":qa<CR>", { desc = "Quit all buffer with save" })
map("n", "<M-q>", "<cmd>q<CR>")


-- Abbrev
vim.cmd("cnoreabbrev Q  q")
vim.cmd("cnoreabbrev q1  q!")
vim.cmd("cnoreabbrev Q1  q!")
vim.cmd("cnoreabbrev Qa1 qa!")
vim.cmd("cnoreabbrev QA! qa!")
vim.cmd("cnoreabbrev qA! qa!")
vim.cmd("cnoreabbrev qa1 qa!")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev W  w!")
vim.cmd("cnoreabbrev w  w!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Set set")
vim.cmd("cnoreabbrev SEt set")
vim.cmd("cnoreabbrev SET set")

-- Move current line up
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Up>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })

-- Move current line down
vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-Down>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })

-- Copy lines up
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':<C-u>execute "t-1"<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-S-Up>', '<Esc>:<C-u>execute "t-1"<CR>gi', { noremap = true })

-- Copy lines down
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':<C-u>execute "t."<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-S-Down>', '<Esc>:<C-u>execute "t."<CR>gi', { noremap = true })

-- Navigating split panes
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W><C-L>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W><C-K>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W><C-J>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W><C-H>', {noremap = true})


