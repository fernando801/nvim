return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			["H"] = { "actions.toggle_hidden", mode = "n" },
			["<leader>b"] = { "actions.close", mode = "n" },
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } }, -- use if you prefer mini.icons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	keys = {
		{ "<leader>-", "<cmd>Oil --float<CR>", desc = "Open parent directory" },
		{ "<leader>b", "<cmd>Oil --float<CR>", desc = "Open parent directory" },
	},
}
