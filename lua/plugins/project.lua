return {
    "ahmedkhalf/project.nvim",
    lazy = true,
    config = function()
        require("project_nvim").setup({
            detection_methods = { "lsp", "pattern" },
            silent_chdir = true
        })
    end
}
