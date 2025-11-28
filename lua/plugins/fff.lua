return {
    "dmtrKovalenko/fff.nvim",
    build = function()
        -- this will download prebuild binary or try to use existing rustup toolchain to build from source
        -- (if you are using lazy you can use gb for rebuilding a plugin if needed)
        require("fff.download").download_or_build_binary()
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
