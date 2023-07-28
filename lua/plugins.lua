local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Space as leader key.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local plugins = {

    'nvim-treesitter/playground',
    'folke/which-key.nvim',
    'windwp/nvim-autopairs',

    {
        -- Autocompletion plugin
        'hrsh7th/nvim-cmp',

        -- load cmp on InsertEnter
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',         -- Path autocompletion
            'hrsh7th/cmp-buffer',       -- Buffer autocompletion
            'hrsh7th/cmp-cmdline',      -- Cmdline autocompletion
            'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
            {'L3MON4D3/LuaSnip', lazy = true}, -- Snippets plugin
        },
        opts = {
            sources = {
                { name = 'path' }
            }
        },
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                },
            })
        end
    },

    -- {
    --     "williamboman/mason.nvim",
    --     build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    --     config = function()
    --         require("mason").setup()
    --
    --     end
    -- },

    -- {
    --     "williamboman/mason-lspconfig.nvim",
    --     config = function()
    --         require("mason-lspconfig").setup {
    --             ensure_installed = { 'clangd', 'ruff_lsp', 'pyright', 'neocmake' },
    --         }
    --     end
    -- },

    {
        -- Configurations for Nvim LSP
        'neovim/nvim-lspconfig',
        config = function()
            require 'lspconfig'.clangd.setup {}
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },

    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {
            signs = false,
        },
    },

    {
        -- commenting
        'numToStr/Comment.nvim',
        opts = {
            toggler = {
                line = ' ;',
            },
            opleader = {
                line = ' ;',
            },
            mappings = {
                basic = true,
                extra = false,
                extended = false,
            },
        },
    },

    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    'Exafunction/codeium.vim',

    {
        -- colorscheme
        'aktersnurra/no-clown-fiesta.nvim',
        config = function()
            vim.cmd([[colorscheme no-clown-fiesta]])
        end
    },
}

require('lazy').setup(plugins)
