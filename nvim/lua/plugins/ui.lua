-- UI plugins configuration

return {
  -- Colorscheme
  -- {
  --   'mofiqul/vscode.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('vscode').setup {
  --       transparent = true,
  --       italic_comments = false,
  --       disable_italic = true,
  --       disable_bold = true,
  --     }
  --
  --     function ColorMyPencils(color)
  --       color = color or 'vscode'
  --       vim.cmd.colorscheme(color)
  --
  --       vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  --       vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  --     end
  --
  --     ColorMyPencils()
  --   end,
  -- },
  -- {
  --   'rose-pine/neovim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('rose-pine').setup {
  --       styles = {
  --         italic = false,
  --         bold = false,
  --       }
  --     }
  --     function ColorMyPencils(color)
  --       color = color or 'rose-pine'
  --       vim.cmd.colorscheme(color)
  --
  --       vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  --       vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  --     end
  --
  --     ColorMyPencils()
  --   end,
  -- },
  {
    'datsfilipe/vesper.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('vesper').setup {
        transparent = false, -- Boolean: Sets the background to transparent
        italics = {
          comments = false, -- Boolean: Italicizes comments
          keywords = false, -- Boolean: Italicizes keywords
          functions = false, -- Boolean: Italicizes functions
          strings = false, -- Boolean: Italicizes strings
          variables = false, -- Boolean: Italicizes variables
        },
        overrides = {
          String = { fg = '#A3BE8C' },
        }, -- A dictionary of group names, can be a function returning a dictionary or a table.
        palette_overrides = {},
      }
      function ColorMyPencils(color)
        color = color or 'vesper'
        vim.cmd.colorscheme(color)

        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      end

      ColorMyPencils()
    end,
  },

  -- Statusline
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  -- Which-key for keybinding hints
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
}
