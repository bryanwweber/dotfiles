require("plugins").setup()

-- Set up tabs
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Set the get-out-of-terminal key to ESC
-- This interferes with using nvim to write commit messages, sadly
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Set up Black to run on save
local blackgroup = vim.api.nvim_create_augroup("black_on_save", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*.py", group = blackgroup, command = "Black"})
vim.g.black_virtualenv = "/home/bryanw/.local/pipx/venvs/black"

-- Set up renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)")

-- Set up NERDTree plugin with a keyboard shortcut and to start without focus if a file is passed
vim.keymap.set("n", "<C-k><C-B>", ":NERDTreeToggle<CR>", { silent = true })
local augroup = vim.api.nvim_create_augroup("nerdtree_open", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {pattern = "*", group = augroup, command = "if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif"})
vim.g.NERDTreeShowHidden = 1

-- Set up Silver Searcher (ag) for fuzzy file finding with ctrlp plugin
if vim.fn.executable('ag') == 1 then
    vim.o.grepprg="ag --nocolor --nogroup"
    vim.g.ctrl_p_user_command = 'ag %s -l --nocolor -g ""'
end
