return {
    {
        "vague2k/vague.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            require("vague").setup({})
            vim.cmd("colorscheme vague")
        end
    },
}
