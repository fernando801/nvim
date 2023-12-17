local lsp = require("lsp-zero")

local cmp = require("cmp")
local luasnip = require("luasnip")
local select_opts = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
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

	-- toggle completion
	["<C-Space>"] = cmp.mapping.complete(),

	-- go to next placeholder in the snippet
	["<C-w>"] = cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" }),

	-- go to previous placeholder in the snippet
	["<C-b>"] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" }),
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup({
	mapping = cmp_mappings,
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
