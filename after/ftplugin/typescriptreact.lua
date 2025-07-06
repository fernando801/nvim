local indent = 2
if require("resen.utils").is_file_inside_work_dir() then
	indent = 4
end

vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.wrap = true
