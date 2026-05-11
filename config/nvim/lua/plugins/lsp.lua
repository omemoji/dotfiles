return {
    -- LSPサーバーの基本設定
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            -- Mason本体
            { "williamboman/mason.nvim", config = true }, -- config = true は require("mason").setup() と同義
            -- MasonとLSPConfigのブリッジ
            "williamboman/mason-lspconfig.nvim",
            -- 補完ソースとしてのLSP (これを依存関係に入れないとエラーになる場合がある)
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            -- nvim-cmp 用の capabilities 設定
            -- (最新のcmp-nvim-lspでは引数なしでも動作しますが、明示的に書くのが安全です)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            mason_lspconfig.setup({
                -- 【重要】tsserver は廃止され、現在は "ts_ls" です
                ensure_installed = { "ts_ls", "lua_ls", "pyright" },

                -- 【重要】handlersを使うのが現在の推奨です
                -- 自動インストールされたサーバーに対して、この設定が適用されます
                handlers = {
                    -- 1. デフォルトハンドラー（すべてのサーバーに共通の設定）
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- 2. 個別のサーバー設定（例: lua_ls）
                    -- Luaの開発時に "vim" が未定義という警告を出さないようにする
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
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
                    end,
                },
            })
        end,
    }
}
