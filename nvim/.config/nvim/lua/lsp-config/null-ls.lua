local null_ls = require("null-ls")
local cspell = require("cspell")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.black.with({prefer_local = ".venv/bin"}),
  formatting.autoflake.with({prefer_local = ".venv/bin"}),
  formatting.isort.with({prefer_local = ".venv/bin"}),
  formatting.lua_format,
  formatting.markdownlint,
  formatting.shfmt,
  formatting.taplo,
  formatting.trim_newlines,
  formatting.trim_whitespace,

  code_actions.gitsigns,
  code_actions.shellcheck,
  cspell.code_actions,

  diagnostics.actionlint,
  cspell.diagnostics,
  diagnostics.hadolint,
  diagnostics.luacheck,
  diagnostics.markdownlint,
  diagnostics.mypy.with({prefer_local = ".venv/bin"}),
  diagnostics.ruff,
  diagnostics.shellcheck,
  diagnostics.yamllint,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
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
  end,
})
