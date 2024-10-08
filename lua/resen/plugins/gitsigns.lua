return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()
		vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { noremap = true })
		vim.keymap.set("n", "<leader>dt", gitsigns.diffthis, { noremap = true })
	end,
}
