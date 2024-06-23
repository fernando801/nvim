return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>e" },
		{ "<leader>a" },
		{ "<D-j>" },
		{ "<D-k>" },
		{ "<D-l>" },
		{ "<D-;>" },
		{ "<C-S-P>" },
		{ "<C-S-N>" },
	},
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()

		vim.keymap.set("n", "<leader>e", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon window" })

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<D-j>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<D-k>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<D-l>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<D-;>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
