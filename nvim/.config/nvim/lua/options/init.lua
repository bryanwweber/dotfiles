local set = vim.opt

-- Set up tabs
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smarttab = true

set.hlsearch = true --> Highlight search terms
set.incsearch = true --> Highlight search terms while typing
set.ignorecase = true --> Ignore case in the search
set.smartcase = true --> Unless there are multiple caps

set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.breakindent = true
set.scrolloff = 5
set.fileencoding = "utf-8"
set.conceallevel = 2

set.relativenumber = true
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"

set.fillchars = "eob: "
