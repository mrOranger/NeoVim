return {
    {
        "nvim-lualine/lualine.nvim",
        config = function ()
            require("lualine").setup({
                options = {
                    theme = "github",
                    icons_enabled = true,
                },
                sections = {
                    lualine_a = {
                        {
                            "filename",
                            path = 1,
                        }
                    }
                }
            })
        end
    }
}
