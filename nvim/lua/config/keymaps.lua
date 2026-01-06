-- Keymaps configuration file
-- This file contains all the key mappings

-- File explorer
vim.keymap.set('n', '<leader>fe', ':Ex<CR>', { desc = 'Открыть файловый менеджер (netrw)' })
vim.g.netrw_banner = 0

-- Buffer navigation
vim.keymap.set('n', '<leader><Tab>', ':b#<CR>', { desc = 'Переключиться на предыдущий буфер' })
vim.keymap.set('n', '<Tab>', 'gt', { desc = 'Следующий tabpage' })
vim.keymap.set('n', '<S-Tab>', 'gT', { desc = 'Предыдущий tabpage' })

-- Diagnostic mappings
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previues [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to previues [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Посмотреть полное сообщение об ошибке' })

-- Toggle mappings
vim.keymap.set('n', '<leader>tl', function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = '[T]oggle [L]istchars' })

-- Terminal mappings
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Movement warnings
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Other mappings
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')