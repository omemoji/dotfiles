-- パスからリポジトリルートとルート相対パスを求める
local function git_paths(path)
    local root = vim.fs.root(path, ".git")
    if not root then
        vim.notify("Gitリポジトリ外です", vim.log.levels.WARN)
        return nil
    end
    return root, vim.fs.relpath(root, path)
end

-- バッファに差分ハイライトを描画し、編集に追従させる。バッファを閉じたら消す
local function attach_inline_diff(buf, original)
    local inline = require("codediff.ui.inline")
    local compute_diff = require("codediff.core.diff").compute_diff

    local function render()
        local modified = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        -- compute_diff は比較元が空だと差分なしを返すので、全行を追加として組み立てる
        local diff = #original > 0 and compute_diff(original, modified)
            or {
                changes = {
                    {
                        original = { start_line = 1, end_line = 1 },
                        modified = { start_line = 1, end_line = #modified + 1 },
                    },
                },
            }
        inline.render_inline_diff(buf, diff, original, modified)
        return diff
    end

    local group = vim.api.nvim_create_augroup("neotree_git_diff_" .. buf, { clear = true })
    vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
        group = group,
        buffer = buf,
        callback = function()
            render()
        end,
    })
    vim.api.nvim_create_autocmd("BufWinLeave", {
        group = group,
        buffer = buf,
        once = true,
        callback = function()
            inline.clear(buf)
            vim.api.nvim_del_augroup_by_id(group)
        end,
    })

    return render()
end

-- ファイルを通常どおり開き、HEADとの差分をその場でハイライトする
local function open_file_with_diff(state, path)
    local root, rel = git_paths(path)
    if not root then
        return
    end

    -- 削除済みファイルは開く実体がないので、codediffの画面で表示する
    if not vim.uv.fs_stat(path) then
        return vim.cmd("CodeDiff --inline -- " .. vim.fn.fnameescape(rel))
    end

    local original = vim.fn.systemlist({ "git", "-C", root, "show", "HEAD:" .. rel })
    if vim.v.shell_error ~= 0 then
        -- 未追跡ファイルはHEADに存在しないので、全行を追加として扱う
        original = {}
    end

    require("neo-tree.utils").open_file(state, path)
    local buf = vim.api.nvim_get_current_buf()
    local first_change = attach_inline_diff(buf, original).changes[1]
    if first_change then
        local line = math.min(first_change.modified.start_line, vim.api.nvim_buf_line_count(buf))
        vim.api.nvim_win_set_cursor(0, { line, 0 })
    end
end

local tree_width = 32

-- ツリーだけが残っていたら、ファイル表示用のウィンドウを作り直す
local function restore_editor_window()
    local wins = vim.tbl_filter(function(win)
        return vim.api.nvim_win_get_config(win).relative == ""
    end, vim.api.nvim_tabpage_list_wins(0))
    if #wins ~= 1 or vim.bo[vim.api.nvim_win_get_buf(wins[1])].filetype ~= "neo-tree" then
        return
    end
    vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), false, { split = "right", win = wins[1] })
    vim.api.nvim_win_set_width(wins[1], tree_width)
end

local function keep_editor_window()
    vim.api.nvim_create_autocmd("WinClosed", {
        group = vim.api.nvim_create_augroup("neotree_keep_editor_window", { clear = true }),
        callback = function()
            -- WinClosed はウィンドウが閉じる前に発火するので、閉じた後で確認する
            vim.schedule(restore_editor_window)
        end,
    })
end

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
        init = keep_editor_window,
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
                width = tree_width,
                mappings = {
                    ["gd"] = "codediff",
                },
            },
            git_status = {
                window = {
                    mappings = {
                        ["<cr>"] = "git_diff_open",
                        ["<2-LeftMouse>"] = "git_diff_open",
                    },
                },
            },
            commands = {
                codediff = function(state)
                    local root, rel = git_paths(state.tree:get_node().path)
                    if root then
                        -- パス指定はリポジトリルートからの相対パスにする必要がある
                        vim.cmd("CodeDiff -- " .. vim.fn.fnameescape(rel))
                    end
                end,
                -- Gitタブ用: ファイルは差分付きで開き、ディレクトリは従来どおり開閉する
                git_diff_open = function(state)
                    local node = state.tree:get_node()
                    if node.type == "file" then
                        open_file_with_diff(state, node.path)
                    else
                        require("neo-tree.sources.common.commands").toggle_node(state)
                    end
                end,
            },
        },
    },
}
