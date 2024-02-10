-- Space as leader key.
vim.g.mapleader = ' '

-- Remove the highlight after searching for text.
vim.o.hlsearch      = false

-- Enable break indent.
vim.o.breakindent   = true

-- Case insensitive searching unless /C or capital in search.
vim.o.ignorecase    = true
vim.o.smartcase     = true

-- Decrease update time.
vim.o.updatetime    = 250

-- Set colorscheme defaults.
vim.o.termguicolors = true

-- Save undo history.
vim.opt.undofile    = true

-- Tab settings.
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4
vim.opt.expandtab   = true
vim.opt.autoread    = true
vim.opt.splitbelow  = true
vim.opt.splitright  = true

-- Copy things from outside of vim.
vim.opt.clipboard   = 'unnamedplus'

-- No wrapping of text.
vim.wo.wrap         = false

vim.diagnostic.config {
    signs = false,
    virtual_text = false,
}
