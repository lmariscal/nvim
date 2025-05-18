return {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opts = {} }
    },
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open parent directory" }
    },
    opts = {
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
