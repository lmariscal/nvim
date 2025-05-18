return {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    dependencies = {
        { "nvim-tree/nvim-web-devicons", opts = {} }
    },
    opts = {
        background_clear = {
            -- "float_win",
            "toggleterm",
            "telescope",
            -- "which-key",
            "renamer",
            "notify",
            -- "nvim-tree",
            -- "neo-tree",
            -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
        },
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        filter = "spectrum"
    }
}
