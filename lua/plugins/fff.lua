return {
    "dmtrKovalenko/fff.nvim",
    build = function()
        require("fff.download").build_binary()
    end,
    dependencies = {
        "folke/snacks.nvim"
    },
    opts = {
        prompt = "> ",
        title = "Find File",
        layout = {
            height = 0.7,
            width = 0.7,
            max_threads = 6,
            preview_position = "left",
            preview_size = 0.5
        }
    },
    lazy = false
}
