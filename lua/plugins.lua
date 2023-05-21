local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- package manager
    use 'wbthomason/packer.nvim'

    use 'nvim-treesitter/playground'

    -- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'         -- Path autocompletion
    use 'hrsh7th/cmp-buffer'       -- Buffer autocompletion
    use 'hrsh7th/cmp-cmdline'      -- Cmdline autocompletion
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'         -- Snippets plugin

    -- Configurations for Nvim LSP
    use 'neovim/nvim-lspconfig'
    require 'lspconfig'.clangd.setup {}
    require 'cmp'.setup {
        sources = {
            { name = 'path' }
        }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup {}
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('telescope').setup {}
        end
    }

    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup({
                signs = false,
            })
        end
    }


    use 'windwp/nvim-autopairs'
    require('nvim-autopairs').setup {}

    -- commenting
    use 'numToStr/Comment.nvim'
    require('Comment').setup({
        toggler = {
            line = ' ;;',
        },
        opleader = {
            line = ' ;',
        },
        mappings = {
            basic = true,
            extra = false,
            extended = false,
        },
    })

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('trouble').setup {} end
    }

    -- use 'Exafunction/codeium.vim'
    -- use 'neanias/everforest-nvim'
    -- require('everforest').setup({ background = "hard" })
    -- require('everforest').load()

    use 'aktersnurra/no-clown-fiesta.nvim'
    vim.cmd [[colorscheme no-clown-fiesta]]
end)
