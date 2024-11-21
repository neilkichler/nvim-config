local keymap = vim.keymap.set

-- Disable arrow keys
local opts = { noremap = true, silent = true }
keymap('', '<Up>', '<Nop>', opts)
keymap('', '<Down>', '<Nop>', opts)
keymap('', '<Left>', '<Nop>', opts)
keymap('', '<Right>', '<Nop>', opts)

-- Disable arrow keys in command-line mode
keymap('c', '<Up>', '<Nop>', opts)
keymap('c', '<Down>', '<Nop>', opts)
keymap('c', '<Left>', '<Nop>', opts)
keymap('c', '<Right>', '<Nop>', opts)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Format code with <leader>f
keymap("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

-- Don't accidently enter macro mode
keymap("n", "Q", "<nop>")

-- Run CMake
keymap("n", "<leader>c", "<cmd>CMakeRun<CR>", { desc = "Run CMake" })

-- Debugger set breakpoint
keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })

-- Debugger step into
keymap("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step into" })

-- Debugger step over
keymap("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "Step over" })

-- Debugger step out
keymap("n", "<leader>ds", "<cmd>DapStepOut<CR>", { desc = "Step out" })

-- Debugger continue
keymap("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Continue" })

-- Debugger restart
keymap("n", "<leader>dr", "<cmd>DapRestart<CR>", { desc = "Restart" })

-- Debugger terminate
keymap("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Terminate" })

-- Debugger toggle UI
keymap("n", "<leader>du", "<cmd>DapUIToggle<CR>", { desc = "Toggle UI" })
