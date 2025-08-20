-- Formatting and linting
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				formatting.stylua,
				formatting.prettierd.with({
					condition = function(utils)
						-- Check for explicit prettier config files
						return utils.root_has_file({
							-- .prettierrc
							".prettierrc",
							".prettierrc.json",
							".prettierrc.yml",
							".prettierrc.yaml",
							-- js and ts
							".prettierrc.js",
							".prettierrc.ts",
							"prettier.config.js",
							"prettier.config.ts",
							-- mjs and mts
							".prettierrc.mjs",
							".prettierrc.mts",
							"prettier.config.mjs",
							"prettier.config.mts",
							-- cjs and cts
							".prettierrc.cjs",
							".prettierrc.cts",
							"prettier.config.cjs",
							"prettier.config.cts",
							-- toml
							".prettierrc.toml",
						})
					end,
				}),
				formatting.clang_format,
				require("none-ls.formatting.autopep8"),
				require("none-ls.formatting.eslint_d"),
				require("none-ls.formatting.rustfmt"),
				require("none-ls.diagnostics.eslint_d").with({
					condition = function(utils)
						return utils.root_has_file({
							".eslintrc.js",
							".eslintrc.json",
							".eslintrc.cjs",
							"eslint.config.js",
						})
					end,
				}),
			},
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use
							vim.lsp.buf.format({
								async = false,
								filter = function(client)
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
							-- instead
							-- vim.lsp.buf.formatting_sync()
						end,
					})
				end
			end,
		})

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"clangd",
				"prettierd",
				"eslint_d",
				"autopep8",
			},
		})
	end,
}
