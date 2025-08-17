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

-- It takes forever on WSL2 to load the clipboard.
-- Define it upfront so neovim doesn't need to search for it.
if jit.os == 'Windows' then
    vim.g.clipboard = {
        name = 'win32yank',
        copy = {
            ["+"] = 'win32yank.exe -i --crlf',
            ["*"] = 'win32yank.exe -i --crlf',
        },
        paste = {
            ["+"] = 'win32yank.exe -o --lf',
            ["*"] = 'win32yank.exe -o --lf',
        },
        cache_enabled = 1,
    }
end

-- Copy things from outside of vim.
vim.o.clipboard = 'unnamedplus'

-- No wrapping of text.
vim.wo.wrap     = false

vim.diagnostic.config {
    signs = false,
    virtual_text = false,
}
