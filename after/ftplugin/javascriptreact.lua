local jsx_indent_size = 2

if not require("resen.utils").is_file_inside_work_dir() then
	vim.opt.tabstop = jsx_indent_size
	vim.opt.softtabstop = jsx_indent_size
	vim.opt.shiftwidth = jsx_indent_size
end

vim.opt.wrap = true
