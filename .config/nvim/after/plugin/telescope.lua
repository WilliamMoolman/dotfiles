local builtin = require("telescope.builtin")

require("telescope").setup({
	file_ignore_patterns = { ".git/*" },
	hidden = true,
	defaults = {
		mappings = {
			i = {
				["<C-s>"] = "select_vertical",
			},
			n = {
				["<C-s>"] = "select_vertical",
			},
		},
	},
	-- Add or modify other options as needed
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
