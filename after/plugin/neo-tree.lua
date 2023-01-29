vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.keymap.set("n", "<leader>b", "<cmd>Neotree toggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>s", "<cmd>Neotree float git_status<CR>", { noremap = true })

require("neo-tree").setup({
	close_if_last_window = true,
	filesystem = {
		components = {
			harpoon_index = function(config, node, state)
				local Marked = require("harpoon.mark")
				local path = node:get_id()
				local succuss, index = pcall(Marked.get_index_of, path)
				if succuss and index and index > 0 then
					return {
						text = string.format(" ⥤ %d", index), -- <-- Add your favorite harpoon like arrow here
						highlight = config.highlight or "NeoTreeDirectoryIcon",
					}
				else
					return {}
				end
			end,
		},
		renderers = {
			file = {
				{ "icon" },
				{ "name", use_git_status_colors = true },
				{ "harpoon_index" }, --> This is what actually adds the component in where you want it
				{ "diagnostics" },
				{ "git_status", highlight = "NeoTreeDimText" },
			},
		},
	},
})
