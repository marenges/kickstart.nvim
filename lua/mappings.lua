-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Navigation in insert mode
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'End of line' })

vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
local next_dia_repeat, prev_dia_repeat = ts_repeat_move.make_repeatable_move_pair(vim.diagnostic.goto_next, vim.diagnostic.goto_prev)
vim.keymap.set('n', '[d', prev_dia_repeat, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', next_dia_repeat, { desc = 'Go to next diagnostic message' })

