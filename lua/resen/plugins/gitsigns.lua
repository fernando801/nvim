return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()
		-- Toggle blame information for the current line
		vim.keymap.set(
			"n",
			"<leader>tb",
			gitsigns.toggle_current_line_blame,
			{ noremap = true, desc = "Toggle Git blame for the current line" }
		)
		-- Show diff for the current file
		vim.keymap.set(
			"n",
			"<leader>dt",
			gitsigns.diffthis,
			{ noremap = true, desc = "View Git diff of the current file" }
		)
		-- Preview the contents of the current hunk
		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { noremap = true, desc = "Preview Git hunk" })
		-- Navigate to the previous hunk
		vim.keymap.set("n", "[c", gitsigns.prev_hunk, { noremap = true, desc = "Go to previous Git hunk" })
		-- Navigate to the next hunk
		vim.keymap.set("n", "]c", gitsigns.next_hunk, { noremap = true, desc = "Go to next Git hunk" })
	end,
}
