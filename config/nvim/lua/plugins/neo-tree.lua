return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
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
