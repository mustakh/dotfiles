-- Autocommands configuration file
-- This file contains all the autocommands

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable folding for JavaScript, TypeScript, TSX and JSX files
vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Enable folding for JS/TS files',
  pattern = { 'javascript', 'typescript', 'tsx', 'jsx' },
  callback = function()
    vim.opt_local.foldmethod = 'expr'
    vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt_local.foldlevel = 99
    vim.opt_local.foldenable = true
  end,
})

-- Force Treesitter to sync when opening JS/TS files to ensure proper folding
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  desc = 'Force Treesitter sync for JS/TS files',
  pattern = { '*.js', '*.ts', '*.tsx', '*.jsx' },
  callback = function()
    if vim.bo.filetype == 'javascript' or vim.bo.filetype == 'typescript' or vim.bo.filetype == 'tsx' or vim.bo.filetype == 'jsx' then
      vim.cmd('silent! TSBufEnable indent')
      vim.cmd('silent! TSBufEnable highlight')
      vim.cmd('silent! TSBufEnable fold')
    end
  end,
})

-- Enable Treesitter highlight, indent and fold for all supported filetypes
vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Enable Treesitter for all supported filetypes',
  pattern = { '*' },
  callback = function()
    local ts_utils = require('nvim-treesitter.ts_utils')
    local parsers = require('nvim-treesitter.parsers')

    if parsers.has_parser() then
      vim.cmd('silent! TSBufEnable indent')
      vim.cmd('silent! TSBufEnable highlight')
      vim.cmd('silent! TSBufEnable fold')
    end
  end,
})