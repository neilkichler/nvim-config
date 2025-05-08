-- Add additional capabilities supported by blink
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
    nmap('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
    nmap('gi', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
    nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<leader>r', vim.lsp.buf.rename, 'Rename')
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
    clangd = {},
    cmake = {},
    ruff = {},
    -- pyright = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
        },
    },
}

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end
}

-- TODO: switch to new builtin lsp support
--
-- vim.lsp.enable({'clangd','cmake','ruff'})
