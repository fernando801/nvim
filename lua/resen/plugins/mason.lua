return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	opts = {
		automatic_enable = {
			exclude = {
				-- requires external plugin for configuration
				"jdtls",
			},
		},
		ensure_installed = {
			"ts_ls",
			"tailwindcss",
			"pyright",
			"lua_ls",
			"rust_analyzer",
			"jdtls",
		},
	},
}
