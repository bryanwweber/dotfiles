return {
	{
		"romgrk/barbar.nvim",
        lazy = false,
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			focus_on_close = "previous",
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
			filetype = {
				-- Sets the icon's highlight group.
				-- If false, will use nvim-web-devicons colors
				custom_colors = false,

				-- Requires `nvim-web-devicons` if `true`
				enabled = true,
			},
		},
		keys = {
			{ "<A-,>", ":BufferPrevious<CR>" },
			{ "<A-.>", ":BufferNext<CR>" },
			{ "<A-<>", ":BufferMovePrevious<CR>" },
			{ "<A->>", ":BufferMoveNext<CR>" },
			{ "<A-1>", ":BufferGoto 1<CR>" },
			{ "<A-2>", ":BufferGoto 2<CR>" },
			{ "<A-3>", ":BufferGoto 3<CR>" },
			{ "<A-4>", ":BufferGoto 4<CR>" },
			{ "<A-5>", ":BufferGoto 5<CR>" },
			{ "<A-6>", ":BufferGoto 6<CR>" },
			{ "<A-7>", ":BufferGoto 7<CR>" },
			{ "<A-8>", ":BufferGoto 8<CR>" },
			{ "<A-9>", ":BufferGoto 9<CR>" },
			{ "<A-0>", ":BufferLast<CR>" },
			{ "<A-c>", ":BufferClose<CR>" },
			{ "<A-p>", ":BufferPick<CR>" },
			{ "<leader>bb", ":BufferOrderByBufferNumber<CR>" },
			{ "<leader>bd", ":BufferOrderByDirectory<CR>" },
			{ "<leader>bl", ":BufferOrderByLanguageCR>" },
		},
	},
}
