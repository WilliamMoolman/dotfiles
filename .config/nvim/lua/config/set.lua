vim.opt.guicursor = ""
-- set to true or false etc.
vim.opt.relativenumber = true -- sets vim.opt.relativenumber
vim.opt.number = true         -- sets vim.opt.number
vim.opt.spell = false         -- sets vim.opt.spell
vim.opt.signcolumn = "auto"   -- sets vim.opt.signcolumn to auto
vim.opt.wrap = false          -- sets vim.opt.wrap
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Undo things
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fF", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>l", ":ls<CR> :b<space>")

vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true })
