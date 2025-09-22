return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        enabled = false, 
        opts = {},
        config = function ()
            vim.cmd.colorscheme("tokyonight")
        end
    }
}
