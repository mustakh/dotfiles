vim.g.have_nerd_font = true

vim.api.nvim_set_hl(0, "Cursor", { bg = "#f38ba8", fg = "#1e1e2e" })      -- normal
vim.api.nvim_set_hl(0, "CursorInsert", { bg = "#a6e3a1", fg = "#1e1e2e" }) -- insert
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.lazy')
