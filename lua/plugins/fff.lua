return {
    "dmtrKovalenko/fff.nvim",
    build = function()
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
    keys = {
        {
            "<leader>f",
            function()
                require('fff').live_grep({
                    grep = {
                        modes = { 'fuzzy', 'plain' }
                    }
                })
            end,
            desc = 'Live fffuzy grep',
        },
    },
    lazy = false
}
