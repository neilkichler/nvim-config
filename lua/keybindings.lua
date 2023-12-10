local keymap = vim.keymap.set

-- Format code with <leader>f
keymap("n", "<leader>f", vim.lsp.buf.format, { desc = "Format" })

-- Toggle Diagnostics Panel
keymap("n", "<leader>dd", "<cmd>TroubleToggle<CR>", { desc = "Toggle Diagnostics" })

-- Don't accidently enter macro mode
keymap("n", "Q", "<nop>")

-- Run CMake using super enter
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
