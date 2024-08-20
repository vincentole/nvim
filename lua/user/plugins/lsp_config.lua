local M = {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim', },
        { 'folke/neodev.nvim' },
        { "lukas-reineke/lsp-format.nvim" },
        "b0o/schemastore.nvim",
    },
}

M.toggle_inlay_hints = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
end

M.config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()
    require("lsp-format").setup {}
    require('neodev').setup()

    require('which-key').add({
        { "<leader>dn", vim.diagnostic.open_float,                             desc = "Open diagnostic" },
        { "<leader>dd", vim.diagnostic.goto_next,                              desc = "Next diagnostic" },
        { "<leader>ds", vim.diagnostic.goto_pcev,                              desc = "Prev diagnostic" },
        { "<leader>da", vim.lsp.codelens.run,                                  desc = "CodeLens action" },
        { "<leader>dq", vim.diagnostic.setloclist,                             desc = "Quickfix" },
        { "<leader>dh", require('user.plugins.lsp_config').toggle_inlay_hints, desc = "Toggle Hints" }
    })

    local on_attach = function(client, bufnr)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })

        vim.keymap.set('n', '<leader>le', vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definion" })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })

        require("lsp-format").on_attach(client, bufnr)

        if client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true)
        end
    end

    local icons = require "user.icons"
    local default_diagnostic_config = {
        signs = {
            active = true,
            values = {
                { name = "DiagnosticSignError", text = icons.diagnostics.Error },
                { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
                { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
                { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
            },
        },
        virtual_text = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(default_diagnostic_config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local servers = {
        angularls = {},
        clangd = {},
        cssls = {},
        emmet_ls = {},
        eslint = {},
        -- gopls = {},
        html = {},
        jsonls = {
            json = {
                schemas = require("schemastore").json.schemas(),
            },
        },
        ols = {},
        rust_analyzer = {},
        tsserver = {},
        yamlls = {},
        tailwindcss = {},
        bashls = {},
        lua_ls = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
                diagnostics = { disable = { 'missing-fields' } },
            },
        },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
        end,
    }
end

return M
