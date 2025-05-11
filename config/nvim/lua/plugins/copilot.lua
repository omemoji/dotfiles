return { {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({})
    end,
    opts = {
        suggestion = { enabled = true }, }
} }
