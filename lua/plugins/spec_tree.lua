return {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
                "nvim-tree/nvim-web-devicons", -- requires hack nerd font
        },
        config = function()
                require("nvim-web-devicons").setup {}
                require("nvim-tree").setup {}
        end,
}
