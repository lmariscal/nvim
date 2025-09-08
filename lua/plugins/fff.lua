return {
    "dmtrKovalenko/fff.nvim",
    build = "cargo build --release",
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
