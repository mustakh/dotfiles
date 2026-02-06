return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = {
      auto_install = true,
      ensure_installed = {
        "bash",
        "css",
        "csv",
        "dockerfile",
        "editorconfig",
        "hcl",
        "helm",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "python",
        "regex",
        "sql",
        "terraform",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      fold = {
        enable = true,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPost',
    config = function()
      require('treesitter-context').setup {
        enable = true,
        max_lines = 3,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = nil,
      }
    end,
  },
}
