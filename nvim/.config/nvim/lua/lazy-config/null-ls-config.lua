local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function on_attach(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

return {
    {
        "jay-babu/mason-null-ls.nvim",
        enabled = false,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        opts = {
            ensure_installed = {
                "black",
                "isort",
                "markdownlint",
                "taplo",
                "shellcheck",
                "stylua",
                "shfmt",
                "cspell",
                "actionlint",
                "hadolint",
                "luacheck",
                "mypy",
                "ruff",
                "yamllint",
                "prettierd",
            },
            automatic_installation = false,
            handlers = {},
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        enabled = false,
        dependencies = { "nvim-lua/plenary.nvim", "davidmh/cspell.nvim" },
        config = function()
            local null_ls = require("null-ls")

            local formatting = null_ls.builtins.formatting
            local code_actions = null_ls.builtins.code_actions
            null_ls.setup({
                sources = {
                    formatting.trim_newlines,
                    formatting.trim_whitespace,
                    code_actions.gitsigns,
                },
                on_attach = on_attach,
            })
        end,
    },
    {
        "davidmh/cspell.nvim",
        enabled = false,
        config = function()
            local cspell = require("cspell")
            require("null-ls").register({
                cspell.code_actions,
                cspell.diagnostics,
            })
        end,
    },
}
