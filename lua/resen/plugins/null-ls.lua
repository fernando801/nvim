-- Formatting and linting
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	-- NOTE: Lazy load the plugin on LspAttach to ensure we can use the lsp
	-- defined root_dir as the root_dir for null-ls
	event = "LspAttach",
	config = function()
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")

		local formatting = null_ls.builtins.formatting

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				formatting.stylua,
				formatting.prettierd.with({
					condition = function(utils)
						-- Check for explicit prettier config files
						return utils.root_has_file({
							-- package.json
							-- "package.json",
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
							-- package.json
							-- "package.json",
							-- .eslintrc
							".eslintrc.js",
							".eslintrc.json",
							".eslintrc.cjs",
							".eslintrc.yml",
							".eslintrc.yaml",
							-- eslint.config
							"eslint.config.js",
							"eslint.config.ts",
							"eslint.config.mjs",
							"eslint.config.mts",
							"eslint.config.cjs",
							"eslint.config.cts",
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
			-- Use the root_dir defined by the lsp clients
			root_dir = function(fname)
				-- Get buffer number for the file
				local bufnr = vim.fn.bufnr(fname)
				if bufnr == -1 then
					-- If buffer doesn't exist, we can't get LSP info
					-- Fall back to null-ls built-in detection
					return null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git")(fname)
				end

				-- Get LSP clients for this buffer
				local clients = vim.lsp.get_clients({ bufnr = bufnr })

				for _, client in ipairs(clients) do
					if client.config and client.config.root_dir then
						return client.config.root_dir
					end
				end

				-- Fallback to standard root pattern detection
				return null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git")(fname)
			end,
		})

		require("mason-null-ls").setup({
			automatic_installation = false,
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
