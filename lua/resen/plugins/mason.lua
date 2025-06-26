return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"ts_ls",
			"pyright",
			"lua_ls",
			"rust_analyzer",
		},
	},
}
