vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- File Tree
return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},

	keys = {
		{ "<leader>b", "<cmd>Neotree toggle<CR>", noremap = true },
		{ "<leader>s", "<cmd>Neotree float git_status<CR>", noremap = true },
	},

	opts = {
		close_if_last_window = true,
		default_component_configs = {
			git_status = {
				symbols = {
					-- Change type
					added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "✖", -- this can only be used in the git_status source
					renamed = "󰁕", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
			},
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
	},
}
