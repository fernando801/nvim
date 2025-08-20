local ts_indent_size = 2

if not require("resen.utils").is_file_inside_work_dir() then
	vim.opt.tabstop = ts_indent_size
	vim.opt.softtabstop = ts_indent_size
	vim.opt.shiftwidth = ts_indent_size
end
