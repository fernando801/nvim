return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } }, -- use if you prefer mini.icons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{ "<leader>-", "<cmd>Oil --float<CR>", desc = "Open parent directory" },
	},
}
