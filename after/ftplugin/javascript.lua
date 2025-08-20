local js_indent_size = 2

if not require("resen.utils").is_file_inside_work_dir() then
	vim.opt.tabstop = js_indent_size
	vim.opt.softtabstop = js_indent_size
	vim.opt.shiftwidth = js_indent_size
end
