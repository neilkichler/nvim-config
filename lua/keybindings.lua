-- Space as leader key.
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Add fuzzy finder shortcuts.
vim.keymap.set('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sf',      [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sb',      [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sh',      [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>st',      [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sd',      [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>sp',      [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>so',      [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<leader>?',       [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- Format code with <leader>f
vim.keymap.set('n', '<leader>f',       [[<cmd>lua vim.lsp.buf.formatting()<CR>]], { noremap = true, silent = true })

-- Go to header or source c++ file
vim.keymap.set('n', '<leader>h',       [[<cmd>ClangdSwitchSourceHeader<CR>]], { noremap = true, silent = true })

-- Toggle Diagnostics Panel
vim.keymap.set('n', '<leader>d',       [[<cmd>TroubleToggle<CR>]], { noremap = true, silent = true })

