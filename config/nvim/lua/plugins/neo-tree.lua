return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
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
                width = 32,
            },
        },
    },
}
