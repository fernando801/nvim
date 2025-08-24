return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").setup({})
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { noremap = true })
		vim.keymap.set("n", "<leader>rg", builtin.live_grep, { noremap = true })
		vim.keymap.set("n", "<leader>gh", builtin.help_tags, { noremap = true })
		vim.keymap.set("n", "<leader>gb", builtin.buffers, { noremap = true })
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true })
		vim.keymap.set("n", "grr", builtin.lsp_references, { noremap = true })
		-- Find hidden and ignored files
		vim.keymap.set("n", "<leader>hf", function()
			builtin.find_files({ hidden = true, no_ignore = true })
		end, { noremap = true })
	end,
}
