return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- Last release is way too old
    build = ":TSUpdate",
    -- event = { "BufReadPost", "BufNewFile" },
    lazy = false,
    main = "nvim-treesitter.configs",
    branch = "master",
    opts = {
        ensure_installed = {
            "c", "cpp", "lua", "python", "javascript", "typescript", "tsx",
            "html", "css", "json", "bash", "yaml", "markdown", "markdown_inline", "go", "rust",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
    -- Fallback config to handle edge cases
    config = function(_, opts)
        -- Protective call: If treesitter fails to load, don't crash neovim
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return
        end
        configs.setup(opts)
    end,
}
