return {
	"github/copilot.vim",
	config = function()
		-- Have copilot disabled by default
		vim.g.copilot_enabled = 0
		vim.g.copilot_no_tab_map = true
		vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	end,
}
