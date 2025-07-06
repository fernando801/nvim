local M = {}

--- Checks if a given file path is within the $WORK_DIR.
--- @return boolean True if the current file is within the $WORK_DIR, false otherwise.
function M.is_file_inside_work_dir()
	local file_path = vim.fn.expand("%:p")
	local work_dir = vim.fn.expand("$WORK_DIR")

	return string.find(file_path, work_dir, 1, true) == 1
end

return M
