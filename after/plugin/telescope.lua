require("telescope").setup()
require("telescope").load_extension("file_browser")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set(
	"n",
	"<leader>hf",
	"<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<CR>",
	{ noremap = true }
)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", { noremap = true })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
