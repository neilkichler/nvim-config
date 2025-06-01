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

-- Don't accidently enter macro mode
keymap("n", "Q", "<nop>")

-- Run CMake
keymap("n", "<leader>c", "<cmd>CMakeRun<CR>", { desc = "Run CMake" })

-- Activate LSP keybindings when an LSP attaches to a particular buffer
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local nmap = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
        end

        nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
        nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
        nmap('gi', vim.lsp.buf.implementation, 'Goto Implementation')
        nmap('gr', vim.lsp.buf.references, 'Goto References')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>r', vim.lsp.buf.rename, 'Rename')
        nmap('<leader>f', vim.lsp.buf.format, 'Format')
    end,
})

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
