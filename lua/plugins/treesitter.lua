return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        local ts = require("nvim-treesitter.configs")
        ts.setup(
            {
                ensure_installed = {
                    "lua", "c", "cpp", "vim", "python", "javascript", "scheme", "typescript", "wgsl", "json",
                    "c_sharp", "rust", "slang", "nim", "proto", "janet_simple", "go", "pug", "html", "css", "typst",
                },
                highlight = { enable = true },
                folding = { enable = true },
                rainbow = { enable = true }
            }
        )
    end
}
