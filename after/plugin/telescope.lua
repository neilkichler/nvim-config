-- Add fuzzy finder shortcuts.
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = 'Goto Buffer' })
vim.keymap.set('n', '<leader>s', builtin.find_files, { desc = 'Goto File' })
vim.keymap.set('n', '<leader>b', builtin.current_buffer_fuzzy_find, { desc = 'Find in File' })
