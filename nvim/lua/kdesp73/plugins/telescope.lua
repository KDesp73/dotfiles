return {
  'nvim-telescope/telescope.nvim',
  -- Track master: 0.1.x calls the removed nvim-treesitter.parsers.ft_to_lang,
  -- which breaks with nvim-treesitter main / Neovim 0.12. Master uses the
  -- built-in vim.treesitter.language.get_lang instead.
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telescope').setup({
      defaults = {
        preview = {
          treesitter = true,
        },
      },
    })
  end,
}
