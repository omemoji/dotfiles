return {
    -- LSP 設定 (Neovim 0.11+ の vim.lsp.config / vim.lsp.enable を使う)
    -- nvim-lspconfig は lsp/*.lua の既定設定を提供するだけで、setup() は呼ばない
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- すべてのサーバー共通: nvim-cmp 用の capabilities
            vim.lsp.config("*", {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            -- 個別設定: Lua 開発時に "vim" が未定義と警告されないようにする
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                    },
                },
            })

            -- mason-lspconfig v2: インストール済みサーバーを自動で vim.lsp.enable() する
            require("mason-lspconfig").setup({
                ensure_installed = { "ts_ls", "lua_ls", "pyright" },
                automatic_enable = true,
            })
        end,
    },
}
