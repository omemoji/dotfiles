return { {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VeryLazy",
    config = function()
        require("copilot").setup({})
    end,
    opts = {
        suggestion = { enabled = true }, }
} }
