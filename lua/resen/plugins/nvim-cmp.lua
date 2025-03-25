-- Autocompletion
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"windwp/nvim-autopairs",
		"VonHeikemen/lsp-zero.nvim",
	},
	config = function()
		-- Here is where you configure the autocompletion settings.
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_cmp()

		-- And you can configure cmp even more, if you want to.
		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()
		local select_opts = { behavior = cmp.SelectBehavior.Select }

		-- If you want insert `(` after select function or method item
		-- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, item)
					local symbol_map = {
						Text = "󰉿",
						Method = "󰆧",
						Function = "󰊕",
						Constructor = "󱌣", --  | 󰣪 | 󱌣
						Field = "󱁐", -- 󱁐 | 󰜢
						Variable = "󰫧", -- 󰫧 | 󰀫
						Class = "󰠱",
						Interface = "",
						Module = "", -- 󰜘 |  | 󰜙 |  |  | 
						Property = "󰜢",
						Unit = "󰑭",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󰏘",
						File = "󰈙",
						Reference = "󰈇",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "󰏿",
						Struct = "󰙅",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "",
					}

					item.kind = symbol_map[item.kind] .. " " .. item.kind
					item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						buffer = "[Buffer]",
						path = "[Path]",
					})[entry.source.name]
					return item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- toggle completion
				["<C-Space>"] = cmp.mapping.complete(),

				-- confirm selection
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-y>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping.confirm({ select = false }),

				-- navigate items on the list
				["<Up>"] = cmp.mapping.select_prev_item(select_opts),
				["<Down>"] = cmp.mapping.select_next_item(select_opts),
				["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
				["<C-n>"] = cmp.mapping.select_next_item(select_opts),

				-- scroll up and down in the completion documentation
				["<C-d>"] = cmp.mapping.scroll_docs(5),
				["<C-u>"] = cmp.mapping.scroll_docs(-5),

				-- navigate snippets
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
