groups = { -- table: default groups
	"Normal",
	"NormalFloat",
	"NormalNC",
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
	vim.api.nvim_set_hl(0, group, { bg = "none" })
end
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
