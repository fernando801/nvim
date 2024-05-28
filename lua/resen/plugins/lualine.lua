return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			--   vim = { "", "", "", "" },
			--   diff_icons = { added = "", modified = "", removed = "" },
			--   github = { "", "", "" },
			--   diagnostics = { error = " ", warn = " ", info = " ", hint = " " },
			--   default = { left = "", right = "" },
			--   round = { left = "", right = "" },
			--   block = { left = "█", right = "█" },
			--   arrow = { left = "", right = "" },
			--   component_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icon = "",
				},
			},
			lualine_b = {
				{
					"branch",
					icon = "",
				},
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
				},
			},
			lualine_c = { "filename" },
			lualine_x = {
				{
					"diagnostics",
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
				},
				"filetype",
				"encoding",
				"fileformat",
			},
			lualine_y = {
				{
					"location",
					padding = { left = 0, right = 1 },
				},
			},
			lualine_z = {
				{
					"progress",
					icon = "",
					padding = { left = 0, right = 1 },
				},
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}
