-- Options configuration file
-- This file contains all the vim options and settings

-- Set leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- UI options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.cursorline = false

-- Indentation and whitespace
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.breakindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Timing
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Window splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Scrolling
vim.opt.scrolloff = 8

-- Wrapping
vim.opt.wrap = false

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Listchars
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Command behavior
vim.opt.inccommand = 'split'

-- File handling
vim.opt.undofile = true
vim.opt.confirm = true

-- Clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Neovide specific settings
if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0
  -- Настройка шрифта для Neovide
  vim.g.neovide_font = 'JetBrains Mono:h14'
  vim.g.neovide_font_antialiasing = true
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_remember_dimensions = true
  vim.g.neovide_hide_mouse_when_typing = true
end

-- Font settings for terminal Neovim (if supported by terminal)
vim.opt.guifont = 'JetBrains Mono:h14'

-- Custom highlights
vim.cmd [[
  highlight DiffAdd guibg=#1e2f1e guifg=none
  highlight DiffDelete guibg=#331c1c guifg=none
  highlight DiffChange guibg=#1c1f33 guifg=none
  highlight Cursor guifg=#331c1c guibg=none
]]
