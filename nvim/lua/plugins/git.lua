-- Git plugins configuration

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gdiffsplit', 'Gstatus' },
    keys = {
      { '<leader>gs', ':Git<CR>', desc = 'Git status (fugitive)' },
    },
  },

  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<CR>', desc = 'Открыть LazyGit' },
    },
  },

  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>', desc = 'Открыть DiffView (Git diff)' },
      { '<leader>gD', '<cmd>DiffviewFileHistory<CR>', desc = 'История файла' },
    },
  },
}