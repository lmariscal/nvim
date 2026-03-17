return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "lua", "c", "cpp", "vim", "python", "javascript", "scheme", "typescript", "wgsl", "json",
                "c_sharp", "rust", "slang", "nim", "proto", "janet_simple", "go", "pug", "html", "css", "typst",
            },
        })
    end
}
