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
            'L3MON4D3/LuaSnip',         -- Snippets plugin
        },
        opts = {
            sources = {
                { name = 'path' }
            }
        },
        config = function()
            local luasnip = require('luasnip')
            -- nvim-cmp setup
            local cmp = require('cmp')
            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = {
                    { name = 'nvim_lsp', keyword_length = 2, max_item_count = 3 },
                    { name = 'buffer',   keyword_length = 5, max_item_count = 3 },
                    { name = 'luasnip',  max_item_count = 3 },
                    { name = 'path' },
                },
                experimental = {
                    ghost_text = true
                },
                view = {
                    entries = "wildmenu"
                },
                completion = {
                    autocomplete = false
                },
                window = {
                    documentation = false
                },
            }

            cmp.setup.cmdline(':', {
                sources = {
                    { name = 'cmdline', keyword_length = 3, max_item_count = 5 }
                }
            })

            cmp.setup.cmdline('/', {
                sources = {
                    { name = 'buffer', keyword_length = 2, max_item_count = 5 }
                }
            })

            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
    },

    {
        -- Configurations for Nvim LSP
        'neovim/nvim-lspconfig',
        config = function()
            require 'lspconfig'.clangd.setup {}
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all"
                ensure_installed = { "c", "cpp" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
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

    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            -- Add fuzzy finder shortcuts.
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = 'Goto Buffer' })
            vim.keymap.set('n', '<leader>s', builtin.find_files, { desc = 'Goto File' })
            vim.keymap.set('n', '<leader>b', builtin.current_buffer_fuzzy_find, { desc = 'Find in File' })
        end

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

    -- code completion
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
