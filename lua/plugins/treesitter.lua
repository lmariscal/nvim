return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local parsers = {
            "lua", "c", "cpp", "vim", "python", "javascript", "scheme", "typescript", "wgsl", "json",
            "c_sharp", "rust", "slang", "nim", "proto", "janet_simple", "go", "pug", "html", "css", "typst",
        }
        require("nvim-treesitter").install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
