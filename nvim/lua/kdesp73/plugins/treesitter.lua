return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    -- 1. Register Blade filetype
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    -- 2. Register Blade parser with the new parser config API
    local parser_config = require("nvim-treesitter.parsers")
    if parser_config then
      local configs = parser_config.get_parser_configs and parser_config.get_parser_configs() or parser_config
      configs.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }
    end

    -- 3. Install your languages using the new install API
    local treesitter = require("nvim-treesitter")
    if treesitter.install then
      treesitter.install({
        "c", "cpp", "lua", "vim", "vimdoc", "query", "javascript",
        "rust", "java", "ruby", "cmake", "svelte", "html", "css",
        "python", "typescript", "blade", "php_only", "php"
      })
    end
  end,
}
