local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettierd,
		formatting.prettierd.with({
			extra_args = { "--single-quote", "--jsx-single-quote" },
			extra_filetypes = {
				"astro",
			},
		}),
		formatting.rustfmt,
		formatting.black,
		diagnostics.eslint_d,
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
						-- filter = function(client)
						-- 	return client.name == "null-ls" or client.name == "astro"
						-- end,
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
	ensure_installed = { "stylua", "prettier", "prettierd", "eslint_d", "rustfmt", "black" },
})
