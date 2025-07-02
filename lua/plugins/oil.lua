return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opts = { } }
    },
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open parent directory" }
    },
    opts = {
        win_options = {
            signcolumn = "yes:2",
        },
        columns = {
            "icon",
            "permissions",
            "size",
        },
        view_options = {
            show_hidden = true,
        }
    },
}
