local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

-- Set

opt.expandtab = true
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.list = true
opt.hidden = true
opt.ignorecase = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.splitright = true
opt.splitbelow = true
opt.wrap = true
opt.autochdir = false
opt.scl = "yes"
opt.completeopt = "menuone,noinsert,noselect"
opt.spelllang = "en_gb"
opt.fileencoding = "utf-8"
opt.makeprg = "just" -- Pretty much the only build tool I use directly

-- Commands

vim.cmd.colorscheme("monokai-pro")

vim.diagnostic.enable(false)

-- Autocmds

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.bo.commentstring = "// %s"
    end,
})
