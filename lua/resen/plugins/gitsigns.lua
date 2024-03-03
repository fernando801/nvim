return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		require("gitsigns").setup()
		vim.keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { noremap = true })
		vim.keymap.set("n", "<leader>dt", "<cmd>Gitsigns diffthis<CR>", { noremap = true })
	end,
}
