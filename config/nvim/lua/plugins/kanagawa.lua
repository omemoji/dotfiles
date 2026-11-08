return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                -- 背景は端末の透過に任せる (行番号などの列も含める)
                transparent = true,
                colors = {
                    theme = {
                        all = {
                            ui = { bg_gutter = "none" },
                        },
                    },
                },
            })
            -- Ghostty の Kanagawa Wave に合わせる
            vim.cmd.colorscheme("kanagawa-wave")
        end,
    },
}
