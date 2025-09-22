return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = false,
        opts = {
            flavor = "mocha",
            backgound = {
                light = "latte",
                dark = "mocha"
            },
            transparent_background = true
        },
        config = function (_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    }
}
