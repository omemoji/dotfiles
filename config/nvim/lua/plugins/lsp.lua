return {
    -- LSPサーバーの基本設定とキーマッピング
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- LSPサーバーを簡単にインストールするための Mason
            {
                "williamboman/mason.nvim",
                config = function()
                    require("mason").setup()
                end,
            },
            -- Mason と nvim-lspconfig を連携させる
            {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                    require("mason-lspconfig").setup({
                        -- インストールしたいLSPサーバー名をここに列挙します
                        -- 例: ensure_installed = { "lua_ls", "rust_analyzer", "tsserver" }
                        ensure_installed = {},
                    })
                end,
            },
        },
        config = function()
            -- 各LSPサーバーに共通の capabilities を設定
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- mason-lspconfig がインストールしたサーバーをループ処理でセットアップ
            local servers = require("mason-lspconfig").get_installed_servers()
            for _, server_name in ipairs(servers) do
                require("lspconfig")[server_name].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
        end,
    }
}
