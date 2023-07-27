-- Space as leader key.
vim.g.mapleader = ' '

local keymap = vim.keymap.set

-- Format code with <leader>f
keymap('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format' })

-- Toggle Diagnostics Panel
keymap('n', '<leader>d', '<cmd>TroubleToggle<CR>', { desc = 'Toggle Diagnostics' })

-- Don't accidently enter macro mode
keymap("n", "Q", "<nop>")
