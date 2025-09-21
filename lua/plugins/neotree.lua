return {
    { 
        "nvim-neo-tree/neo-tree.nvim", 
        branch = "v3.x", 
        dependencies = { 
            "nvim-lua/plenary.nvim", 
            "nvim-tree/nvim-web-devicons", 
            "MunifTanjim/nui.nvim" 
        },
        config = function ()
            
            require("neo-tree").setup({
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                        leave_dirs_open = true,
                    },
                    use_libuv_file_watcher = true,
                    hijack_netrw_behaviour = "open_current",
                },
                window = {
                    position = "left",
                    auto_expand_width = false,
                    mapping_options = {
                        noremap = true,
                        nowait = true,
                    },
                },
            })

            vim.keymap.set("n", "<leader>tl", ":Neotree filesystem reveal left<CR>", {})
            vim.keymap.set("n", "<leader>tr", ":Neotree filesystem reveal right<CR>", {})
        end
    },
}
