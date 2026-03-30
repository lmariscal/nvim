return {
    "SmiteshP/nvim-navic",
    lazy = false,
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
        lsp = { auto_attach = true },
        highlight = true,
        separator = " → ",
        depth_limit = 5,
    },
}