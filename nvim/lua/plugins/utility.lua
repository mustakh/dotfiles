-- Utility plugins configuration

return {
  {
    'tpope/vim-sleuth',  -- Detect tabstop and shiftwidth automatically
  },

  {
    'kkrampis/codex.nvim',
    lazy = true,
    cmd = { 'Codex', 'CodexToggle' },
    keys = {
      {
        '<leader>cc',
        function()
          require('codex').toggle()
        end,
        desc = 'Toggle Codex popup or side-panel',
        mode = { 'n', 't' },
      },
    },
    opts = {
      keymaps = {
        toggle = nil,
        quit = '<C-q>',
      },
      border = 'rounded',
      width = 0.8,
      height = 0.8,
      model = nil,
      autoinstall = true,
      panel = false,
      use_buffer = false,
    },
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      local mark = harpoon:list()
      vim.keymap.set('n', '<leader>a', function()
        mark:add()
      end, { desc = 'Добавить файл в Harpoon' })
      vim.keymap.set('n', '<leader>h', function()
        harpoon.ui:toggle_quick_menu(mark)
      end, { desc = 'Открыть меню Harpoon' })
      vim.keymap.set('n', '<leader>dx', function()
        mark:remove_at(1)
      end, { desc = 'Удалить файл 1 из Harpoon' })
      vim.keymap.set('n', '<leader>1', function()
        mark:select(1)
      end, { desc = 'Перейти к файлу 1' })
      vim.keymap.set('n', '<leader>2', function()
        mark:select(2)
      end, { desc = 'Перейти к файлу 2' })
      vim.keymap.set('n', '<leader>3', function()
        mark:select(3)
      end, { desc = 'Перейти к файлу 3' })
      vim.keymap.set('n', '<leader>4', function()
        mark:select(4)
      end, { desc = 'Перейти к файлу 4' })
    end,
  },

  {
    'mbbill/undotree',
    keys = {
      { '<leader>u', ':UndotreeToggle<CR>', desc = 'Открыть UndoTree' },
    },
    cmd = 'UndotreeToggle',
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}