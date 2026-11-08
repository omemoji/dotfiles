-- ~/.config/nvim/lua/plugins/claudecode.lua
return {
    "coder/claudecode.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/snacks.nvim",
    },
    config = function()
        -- claude は zellij のペインで起動し、`claude --ide` で接続する
        require("claudecode").setup({
            terminal = { provider = "none" },
        })
    end,
}
