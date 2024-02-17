require("catppuccin").setup({
        mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
    flavour = "mocha",

    color_overrides = {
    },

    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})
vim.cmd("colorscheme catppuccin")
