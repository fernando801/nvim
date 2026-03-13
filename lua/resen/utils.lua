local M = {}

--- Checks if a given file path is within any configured work directory.
--- @return boolean True if the current file is within any work directory, false otherwise.
function M.is_file_inside_work_dir()
	local file_path = vim.fn.expand("%:p")
	local work_dirs = {
		vim.fn.expand("$WORK_DIR"),
		vim.fn.expand("$ORAHUB_DIR"),
	}

	for _, work_dir in ipairs(work_dirs) do
		work_dir = vim.trim(work_dir)
		if work_dir ~= "" and string.find(file_path, work_dir, 1, true) == 1 then
			return true
		end
	end

	return false
end

return M
