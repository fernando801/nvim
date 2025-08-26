return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme catppuccin-mocha")

		local groups = { -- table: default groups
			"Normal",
			"NormalFloat",
			"NormalNC",
			"FloatTitle",
			"FloatBorder",
			-- "Comment",
			-- "Constant",
			-- "Special",
			-- "Identifier",
			-- "Statement",
			-- "PreProc",
			-- "Type",
			-- "Underlined",
			-- "Todo",
			-- "String",
			-- "Function",
			-- "Conditional",
			-- "Repeat",
			-- "Operator",
			-- "Structure",
			-- "LineNr",
			-- "NonText",
			-- "SignColumn",
			-- "CursorLine",
			-- "CursorLineNr",
			-- "StatusLine",
			-- "StatusLineNC",
			-- "EndOfBuffer",
		}

		for _, group in ipairs(groups) do
			--- @type vim.api.keyset.highlight
			local hl = vim.api.nvim_get_hl(0, { name = group })
			hl.bg = "none" -- override only the background
			vim.api.nvim_set_hl(0, group, hl)
		end
	end,
}
