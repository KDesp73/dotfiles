return {
  'nvim-telescope/telescope.nvim',
  -- Change 'tag' to track the 0.1.x maintenance branch (or remove both to use master)
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Add nvim-treesitter as a dependency so it loads properly alongside telescope
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        -- Optional: ensures regex fallback works seamlessly if treesitter fails on a file
        preview = {
          treesitter = true,
        },
      },
    })
  end,
}
