local notify = require("notify")

notify.setup({
	-- Animation style (see below for details)
	stages = "fade",

	-- Default timeout for notifications
	timeout = 5000,

	-- For stages that change opacity this is treated as the highlight behind the
	-- window. Set this to either a highlight group or a hex color code.
	background_colour = "#000000",

	-- Icons for the different levels
	icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	},
})

vim.notify = notify
