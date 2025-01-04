-- use 256 colors in terminal
if vim.api.nvim_call_function("has", { "gui_running" }) == 0 then
    vim.api.nvim_command("set t_Co=256")
    vim.env.TERM = "xterm-256color"
end

-- fix cursor display in cygwin
if vim.api.nvim_call_function("has", { "win32unix" }) == 1 then
    vim.o.t_ti = vim.o.t_ti .. "\27[1 q"
    vim.o.t_SI = vim.o.t_SI .. "\27[5 q"
    vim.o.t_EI = vim.o.t_EI .. "\27[1 q"
    vim.o.t_te = vim.o.t_te .. "\27[0 q"
end
