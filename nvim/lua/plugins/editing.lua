-- Editing plugins configuration

return {
  -- Auto pairs for brackets, quotes, etc.
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.pairs').setup()
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