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

local plugins = {
    {
        -- colorscheme
        'aktersnurra/no-clown-fiesta.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme no-clown-fiesta]])
        end
    },

    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            require('mini.icons').setup({
                style = 'ascii'
            })
        end
    },

    {
        -- file explorer
        'stevearc/oil.nvim',
        opts = {},
        keys = {
            {
                "-",
                "<cmd>Oil<cr>",
                desc = "Open File Explorer [Oil]",
            },
        },
        dependencies = { { "echasnovski/mini.icons", opts = { style = 'ascii' } } },
        config = function()
            require('oil').setup()
        end
    },

    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            icons = {
                mappings = false,
                rules = false,
                keys = {
                    Space = "⎵ ",
                }
            },
            show_help = false
        }
    },

    'windwp/nvim-autopairs',

    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        opts = {
            keymap = { preset = 'super-tab' },
            completion = {
                menu = {
                    -- Don't automatically show the completion menu in some scenarios
                    auto_show = function(ctx)
                        return not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
                            and not vim.tbl_contains({ 'c', 'cpp', 'python' }, vim.bo.filetype)
                            and vim.b.completion ~= false
                            or ctx.mode == 'cmdline'
                    end
                },

                -- Display a preview of the selected item on the current line
                ghost_text = { enabled = true },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
                min_keyword_length = function(ctx)
                    return ctx.mode == 'cmdline' and 3 or 5
                end
            },
        },
    },

    {
        'mason-org/mason.nvim',
        version = '2.*',
        opts = {}
    },

    {
        -- Configurations for Nvim LSP
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'mason-org/mason.nvim',           version = '2.*' },
            { 'mason-org/mason-lspconfig.nvim', version = '2.*' },
            'saghen/blink.cmp',
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            -- mason-lspconfig requires that these setup functions are called in this order
            -- before setting up the servers.
            require('mason').setup()
            require('mason-lspconfig').setup()
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile', 'VeryLazy' },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = { "c", "cpp", "python" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                -- List of parsers to ignore installing (or "all")
                ignore_install = { "latex" },

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
                    -- list of language that will be disabled
                    disable = { "latex" },
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                incremental_selection = {
                    enable = true
                },

                indent = {
                    enable = true
                }
            }
        end
    },

    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            -- Add fuzzy finder shortcuts.
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = 'Goto Buffer' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Find File' })
            vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Telscope Builtins' })
            vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Find in File' })
            vim.keymap.set('n', '<leader>s/', builtin.live_grep, { desc = 'Live Grep in Open Files' })

            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = 'Search Neovim config files' })
        end
    },

    -- commenting
    {
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {
            signs = false,
        },
    },

    {
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
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
        opts = {
            focus = true,
            warn_no_results = false,
            open_no_results = true
        },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Toggle Diagnostics Panel",
            },
        }
    },

    -- {
    --     -- code completion
    --     "Exafunction/codeium.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "hrsh7th/nvim-cmp",
    --     },
    --     config = function()
    --         require("codeium").setup({})
    --     end
    -- },

    -- {
    --     'Civitasv/cmake-tools.nvim',
    --     event = 'VeryLazy',
    --     dependencies = 'nvim-lua/plenary.nvim',
    -- },

    -- Latex
    {
        'lervag/vimtex',
        event = 'VeryLazy',
        -- lazy = false,     -- we don't want to lazy load VimTeX
        init = function()
            -- VimTeX configuration goes here
        end
    },
    -- -- Debugger
    -- {
    --     "mfussenegger/nvim-dap",
    --     event = "VeryLazy",
    --     dependencies = { "nvim-neotest/nvim-nio" },
    -- },
    -- {
    --     "mfussenegger/nvim-dap-python",
    --     event = "VeryLazy",
    -- },
    -- {
    --     "theHamsta/nvim-dap-virtual-text",
    --     event = "VeryLazy",
    -- },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     event = "VeryLazy",
    --     dependencies = { "mfussenegger/nvim-dap" },
    --     config = function()
    --         local dap = require("dap")
    --         local dapui = require("dapui")
    --         dapui.setup()
    --         dap.listeners.after.event_initialized["dapui_config"] = function()
    --             dapui.open()
    --         end
    --         dap.listeners.before.event_terminated["dapui_config"] = function()
    --             dapui.close()
    --         end
    --         dap.listeners.before.event_exited["dapui_config"] = function()
    --             dapui.close()
    --         end
    --     end
    -- },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     event = "VeryLazy",
    --     dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    --     opts = {
    --         handlers = {}
    --     },
    --     config = function()
    --         require("mason-nvim-dap").setup({
    --             ensure_installed = { "python" },
    --
    --             automatic_installation = true,
    --         })
    --     end
    -- },
}

require('lazy').setup(plugins, {
    performance = {
        rtp = {
            disabled_plugins = {
                "netrwPlugin",
                "gzip",
                "rplugin",
                "spellfile",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zip",
                "zipPlugin"
            }
        }
    },
    rocks = {
        enabled = false
    }
})
