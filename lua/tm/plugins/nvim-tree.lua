local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    disable_netrw = true,
    hijack_netrw = true,
    update_cwd = true,
    diagnostics = {
        enable = true,
    },
    filters = {
        exclude = { "vendor", "bin" },
    },
    renderer = {
        icons = {
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
            },
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        adaptive_size = true,
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                { key = "h", cb = tree_cb("close_node") },
                { key = "v", cb = tree_cb("vsplit") },
            },
        },
    },
})
