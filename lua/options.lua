-- Space as leader key.
vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

-- Remove the highlight after searching for text.
vim.o.hlsearch       = false

-- Enable break indent.
vim.o.breakindent    = true

-- Case insensitive searching unless /C or capital in search.
vim.o.ignorecase     = true
vim.o.smartcase      = true

-- Decrease update time.
vim.o.updatetime     = 250

-- Set colorscheme defaults.
vim.o.termguicolors  = true

-- Save undo history.
vim.o.undofile       = true

-- Tab settings.
vim.o.tabstop        = 4
vim.o.shiftwidth     = 4
vim.o.softtabstop    = 4
vim.o.expandtab      = true
vim.o.autoread       = true
vim.o.splitbelow     = true
vim.o.splitright     = true

-- No wrapping of text.
vim.wo.wrap          = false

-- Copy things from outside of vim.
vim.schedule(function()
    vim.o.clipboard = 'unnamedplus'
end)

-- Disable diagnostic symbols on the sidebar.
vim.diagnostic.config({ signs = false })
