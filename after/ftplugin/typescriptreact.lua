local tsx_indent_size = 2

if not require("resen.utils").is_file_inside_work_dir() then
	vim.opt.tabstop = tsx_indent_size
	vim.opt.softtabstop = tsx_indent_size
	vim.opt.shiftwidth = tsx_indent_size
end

vim.opt.wrap = true
