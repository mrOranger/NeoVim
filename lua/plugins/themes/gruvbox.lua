return { 
    {
        "ellisonleao/gruvbox.nvim",
        enabled = false,
        opts = {
            undercurl = true,
            terminal_colors = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true,
            contrast = "",
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.cmd.colorscheme("gruvbox")
        end,
    }
}
