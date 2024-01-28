local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
	f = {
		name = "file", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		F = { "Format File" },
	},
	s = {
		name = "session",
		s = { "<cmd>SessionManager save_current_session<cr>", "Save Session" },
		l = { "<cmd>SessionManager load_session<cr>", "Load Session" },
		d = { "<cmd>SessionManager delete_session<cr>", "Delete Session" },
	},
}, { prefix = "<leader>" })
