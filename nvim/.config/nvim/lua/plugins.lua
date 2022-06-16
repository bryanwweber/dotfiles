local M = {}

function M.setup()

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }
  
    -- Colorscheme
    use {
      "sainnhe/everforest",
      config = function()
        vim.cmd "colorscheme everforest"
      end,
    }

    -- Load only when required
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Language Server Protocol Configuration
    use {'neoclide/coc.nvim', branch = 'release'}

    -- Black Python formatting
    use { 'psf/black', branch = 'main' }

    -- ctrlp file searching
    use { 'ctrlpvim/ctrlp.vim', tag = "*" }

    -- Git
    use {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("config.neogit").setup()
      end,
    }

    use {
        'akinsho/git-conflict.nvim',
	config = function()
            require('git-conflict').setup()
        end
    }

    -- Markdown
    use {
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
      ft = "markdown",
      cmd = { "MarkdownPreview" },
    }

    use { "preservim/nerdtree" }
    use { "ryanoasis/vim-devicons" }
  end


  local packer = require "packer"
  packer.init()
  packer.startup(plugins)
end

return M
