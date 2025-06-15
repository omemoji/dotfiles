return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = {
            source_selector = {
                winbar = true,
                statusline = true,
            },
            default_component_configs = {
                indent = {
                    indent_size = 2,
                    padding = 0,
                },
            },
            window = {
                width = 60,
            },
        },
    },
}
