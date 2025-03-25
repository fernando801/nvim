return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		require("telescope").setup()
		require("telescope").load_extension("file_browser")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { noremap = true })
		vim.keymap.set("n", "<leader>rg", builtin.live_grep, { noremap = true })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true })
		vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true })
		-- vim.keymap.set("n", "<leader>bf", builtin.buffers, { noremap = true })
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", { noremap = true })
		-- Find hidden and ignored files
		vim.keymap.set(
			"n",
			"<leader>hf",
			"<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<CR>",
			{ noremap = true }
		)
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
