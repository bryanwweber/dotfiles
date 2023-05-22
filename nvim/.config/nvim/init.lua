require("packer-config").setup()
require("options")
require("keymap-config")
require("lualine-config")
require("barbar-config")
require("nvim-tree-config")
require("toggleterm-config")
require("comment-nvim-config")
require("colorizer-config")
require("indent-blankline-config")
require("telescope-config")
-- require("treesitter-config")
-- require("mason-config")
-- require("lsp-config.lsp")
-- require("lsp-config.completion")
-- require("lsp-config.null-ls")

-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- -- require"lspconfing".pyright.setup{}
-- local null_ls = require("null-ls")
-- 
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.black,
--         null_ls.builtins.diagnostics.markdownlint,
--     },
--     -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     vim.lsp.buf.format({ bufnr = bufnr })
--                 end,
--             })
--         end
--     end,
-- })
-- 
-- -- Set the get-out-of-terminal key to ESC
-- -- This interferes with using nvim in the built-in terminal to write commit messages,
-- -- sadly
-- -- vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
-- 
-- -- Set up Black to run on save
-- -- local blackgroup = vim.api.nvim_create_augroup("black_on_save", { clear = true })
-- -- vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*.py", group = blackgroup, command = "Black"})
-- -- vim.g.black_virtualenv = "/home/bryanw/.local/pipx/venvs/black"
-- 
-- -- Set up NERDTree plugin with a keyboard shortcut and to start without focus if a file is passed
-- vim.keymap.set("n", "<C-k><C-B>", ":NERDTreeToggle<CR>", { silent = true })
-- local augroup = vim.api.nvim_create_augroup("nerdtree_open", { clear = true })
-- vim.api.nvim_create_autocmd("VimEnter", {pattern = "*", group = augroup, command = "if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif"})
-- vim.g.NERDTreeShowHidden = 1
-- 
-- -- Set up Silver Searcher (ag) for fuzzy file finding with ctrlp plugin
-- if vim.fn.executable('ag') == 1 then
--     set.grepprg="ag --nocolor --nogroup"
--     vim.g.ctrl_p_user_command = 'ag %s -l --nocolor -g ""'
-- end
-- 
-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- 
-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--   callback = function(ev)
--     -- Enable completion triggered by <c-x><c-o>
--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
-- 
--     -- Buffer local mappings.
--     -- See `:help vim.lsp.*` for documentation on any of the below functions
--     local opts = { buffer = ev.buf }
--     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<space>f', function()
--       vim.lsp.buf.format { async = true }
--     end, opts)
--   end,
-- })
