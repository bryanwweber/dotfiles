local M = {}

function M.setup()

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }
  
    -- Icons
    use { "nvim-tree/nvim-web-devicons" }

    -- Highlight colors like #RRGGBBAA in the buffer
    use { "norcalli/nvim-colorizer.lua" }

    -- Status line
    use { "nvim-lualine/lualine.nvim" }

    -- Tabs
    -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
    use { "lewis6991/gitsigns.nvim" } -- OPTIONAL: for git status
    use { "romgrk/barbar.nvim" }

    -- Filetree
    use { "nvim-tree/nvim-tree.lua" }

    -- Indentation guide
    use { "lukas-reineke/indent-blankline.nvim" }

    -- Toggle showing/hiding the terminal
    use { "akinsho/toggleterm.nvim" }

    -- File search/picker
    use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" }, }

    -- Fuzzy finder plugin for Telescope
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Toggle comments in code
    use { "numToStr/Comment.nvim" }

    -- Jump to anywhere on the screen
    use { "ggandor/leap.nvim" }

    -- Treesitter for syntax highlighting
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- Refactoring/go-to-definition plugin for Treesitter
    -- with fallback to LSP if needed
    use { 
          "nvim-treesitter/nvim-treesitter-refactor",
          requires = { "nvim-treesitter/nvim-treesitter" }
        }

    -- Autocompletion with LSP support
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }

    -- Autocompletion snippets
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }

    -- Colorscheme
    use {
      "sainnhe/everforest",
      config = function()
        vim.cmd "colorscheme everforest"
      end,
    }

    -- Mason.nvim manages LSP plugins
    use {
      "williamboman/mason.nvim",
      run = ":MasonUpdate", -- :MasonUpdate updates registry contents
    }
    use {
      "williamboman/mason-lspconfig.nvim",
      requires = { "neovim/nvim-lspconfig" },
    }

    use { "mfussenegger/nvim-dap" }
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    }

    use { "davidmh/cspell.nvim" }

    -- Load only when required
    use { "nvim-lua/plenary.nvim" }
  end


  local packer = require "packer"
  packer.init()
  packer.startup(plugins)
end

return M
