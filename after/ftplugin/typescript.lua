local file_path = vim.fn.expand("%:p")
local work_dir = vim.fn.expand("$WORK_DIR")

local indent = 2
if string.find(file_path, work_dir, 1, true) == 1 then
	indent = 4
end

vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
