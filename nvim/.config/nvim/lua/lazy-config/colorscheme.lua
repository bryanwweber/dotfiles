return {
	-- Colorscheme
	{
		"rebelot/kanagawa.nvim",
		opts = {
			compile = true,
			theme = "lotus",
		},
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme kanagawa]])
		end,
	},
}
