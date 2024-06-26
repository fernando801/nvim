return {
	-- Tmux
	"christoomey/vim-tmux-navigator",

	-- Smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = true,
	},

	-- UI select/input
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- Automatic bracket pairs
	{
		"windwp/nvim-autopairs",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	-- Autoclose and rename html tags
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
