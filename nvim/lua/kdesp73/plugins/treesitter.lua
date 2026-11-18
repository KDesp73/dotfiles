return {
  "nvim-treesitter/nvim-treesitter",
  -- The master branch is frozen at the 0.11-era API. Neovim 0.12 needs main.
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Register Blade filetype
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    -- Install languages (blade is included in nvim-treesitter's parser list).
    -- nvim-treesitter's main branch compiles parsers with the tree-sitter CLI.
    if vim.fn.executable("tree-sitter") == 1 then
      require("nvim-treesitter").install({
        "c", "cpp", "lua", "vim", "vimdoc", "query", "javascript",
        "rust", "java", "ruby", "cmake", "svelte", "html", "css",
        "python", "typescript", "blade", "php_only", "php",
      })
    end
  end,
}
