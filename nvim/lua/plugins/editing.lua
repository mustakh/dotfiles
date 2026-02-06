-- Editing plugins configuration

return {

  -- Auto pairs for brackets and quotes
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({
        map_char = {
          all = '(',
          tex = '{',
        },
        enable_check_bracket_line = false,
        check_ts = true,
        ts_config = {
          lua = { 'string', 'source' },
          javascript = { 'string', 'template_string' },
          java = false,
        },
        disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
        enable_moveright = true,
        disable_in_macro = false,
        enable_afterquote = true,
        map_bs = true,
        map_c_w = false,
        disable_in_visualblock = false,
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
          offset = 0, -- Offset from pattern match
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey = 'Comment',
        },
      })
    end,
  },

  -- Auto tag for HTML/XML
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'javascript', 'typescriptreact', 'javascriptreact' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- Surround text objects
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
    end,
  },

  -- Text objects
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
    end,
  },

  -- Visual multi cursor
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    init = function()
      vim.g.VM_default_mappings = false
      vim.g.VM_maps = {
        ['Find Under'] = '<leader>n', -- Alt + n
        ['Find Subword Under'] = '<leader>n',
      }
    end,
  },

  -- File tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        window = {
          position = 'left',
          width = 30,
          line_numbers = true,
          relative_line_numbers = true,
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
        },
      }
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Открыть дерево файлов (NeoTree)' })
    end,
  },

  -- Oil file manager
  {
    'stevearc/oil.nvim',
    opts = {
      keymaps = {
        ['<CR>'] = 'actions.select', -- Enter — открывает файл
        ['q'] = 'actions.close', -- q — закрывает oil
      },
    },
    keys = {
      { '-', '<cmd>Oil<CR>', desc = 'Открыть файловый менеджер (oil)' },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}