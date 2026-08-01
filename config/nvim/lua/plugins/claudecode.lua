-- ~/.config/nvim/lua/plugins/claudecode.lua
return {
    "coder/claudecode.nvim",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "folke/snacks.nvim",
    },
    config = function()
        require("claudecode").setup({})
    end,
}
