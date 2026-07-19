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
        'stevearc/overseer.nvim',
        opts = {
        },
    },

    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            on_attach = function(bufnr)
                local gs = require("gitsigns")

                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, {
                        buffer = bufnr,
                        silent = true,
                        desc = desc,
                    })
                end

                -- Navigation
                map("n", "hn", function() gs.nav_hunk('next') end, "Next Hunk")
                map("n", "hN", function() gs.nav_hunk('prev') end, "Previous Hunk")

                -- Actions
                map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
                map('v', '<leader>hs', function()
                    gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)

                map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
                map('v', '<leader>hr', function()
                    gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)

                -- Visualization
                map("n", "<leader>hh", gs.setqflist, "List Hunks")
                map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>hb", gs.blame_line, "Blame Line")

                -- Diff
                map("n", "<leader>hd", gs.diffthis, "Diff This")
            end,
        },
    },

    {
        -- git integration
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "sindrets/diffview.nvim",
            "m00qek/baleia.nvim",
            "nvim-telescope/telescope.nvim",
        },
        cmd = "Neogit",
        keys = {
            { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
        }
    },

    {
        -- keybindings viewer
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
        -- autocomplete
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*',
        event = { 'BufWritePost', 'BufNewFile', 'VeryLazy' },
        opts = {
            keymap = {
                preset = 'default',
                ['<M-j>'] = {
                    function(cmp)
                        if cmp.snippet_active() then
                            return cmp.select()
                        else
                            return cmp.select_and_accept()
                        end
                    end,
                    'select_next',
                    'fallback' },
                ['<M-k>'] = { 'select_prev', 'fallback' },
            },
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

                -- Don't preselect items in the completion menu
                list = {
                    selection = {
                        preselect = function()
                            return not require('blink.cmp').is_menu_visible()
                        end,
                        auto_insert = true
                    }
                }
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
        -- language-server configuration
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim',                     version = '2.*' },
            { 'mason-org/mason-lspconfig.nvim',           version = '2.*' },
            { 'WhoIsSethDaniel/mason-tool-installer.nvim' }, -- tree-sitter CLI must be installed system-wide
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
            require('mason-tool-installer').setup({
                ensure_installed = { 'tree-sitter-cli' }
            })
        end
    },

    {
        -- syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').setup({
                install = { "c", "cpp", "lua", "markdown", "markdown_inline", "python" },
            })
        end
    },

    {
        -- fuzzy finder
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader><space>', '<cmd>Telescope buffers<cr>',                   desc = 'Goto Buffer' },
            { '<leader>sf',      '<cmd>Telescope find_files<cr>',                desc = 'Find File' },
            { '<leader>ss',      '<cmd>Telescope builtin<cr>',                   desc = 'Search Telescope Builtins' },
            { '<leader>sd',      '<cmd>Telescope diagnostics<cr>',               desc = 'Search Diagnostics' },
            { '<leader>s/',      '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Find in File' },
            { '<leader>/',       '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Find in File' },
            { '<leader>sg',      '<cmd>Telescope live_grep<cr>',                 desc = 'Live Grep in Open Files' },
            {
                '<leader>sn',
                '<cmd>Telescope find_files cwd=' .. vim.fn.stdpath('config') .. '<cr>',
                desc = 'Search Neovim config files'
            },
        },
    },

    {
        -- comment highlighting of TODO, NOTE, etc.
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {
            signs = false,
        },
    },
    {
        -- language agnostic commenting
        'numToStr/Comment.nvim',
        event = 'VeryLazy',
        opts = {
            toggler = {
                line = '<leader>;',
            },
            opleader = {
                line = '<leader>;',
            },
            mappings = {
                basic = true,
                extra = false,
                extended = false,
            },
        },
    },
    {
        -- diagnostics viewer
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

    {
        -- latex support
        'lervag/vimtex',
        event = 'VeryLazy',
        -- lazy = false,     -- we don't want to lazy load VimTeX
        init = function()
            -- VimTeX configuration goes here
        end
    },
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
