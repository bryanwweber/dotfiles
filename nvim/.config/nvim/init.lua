require("plugins").setup()

local set = vim.opt

-- Set up tabs
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Set the get-out-of-terminal key to ESC
-- This interferes with using nvim in the built-in terminal to write commit messages,
-- sadly
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Set up Black to run on save
-- local blackgroup = vim.api.nvim_create_augroup("black_on_save", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*.py", group = blackgroup, command = "Black"})
-- vim.g.black_virtualenv = "/home/bryanw/.local/pipx/venvs/black"

-- Set up renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)")

-- Other Coc configuration from their README
-- https://github.com/neoclide/coc.nvim#example-vim-configuration
set.hidden = true
set.cmdheight = 2
set.updatetime = 300
set.signcolumn = "number"

vim.cmd[[inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : CheckBackspace() ? "\<TAB>" : coc#refresh()]]
vim.cmd[[inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"]]
vim.cmd[[function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]]
vim.cmd[[inoremap <silent><expr> <c-space> coc#refresh()]]
vim.cmd[[inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]]
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })
vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })

-- Set up NERDTree plugin with a keyboard shortcut and to start without focus if a file is passed
vim.keymap.set("n", "<C-k><C-B>", ":NERDTreeToggle<CR>", { silent = true })
local augroup = vim.api.nvim_create_augroup("nerdtree_open", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {pattern = "*", group = augroup, command = "if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif"})
vim.g.NERDTreeShowHidden = 1

-- Set up Silver Searcher (ag) for fuzzy file finding with ctrlp plugin
if vim.fn.executable('ag') == 1 then
    set.grepprg="ag --nocolor --nogroup"
    vim.g.ctrl_p_user_command = 'ag %s -l --nocolor -g ""'
end
