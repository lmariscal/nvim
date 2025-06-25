local utils = require("utils")

-- Default leader key in NeoVim is '\'
-- But remapped to ' ' in lazy-bstrp.lua

utils.map("n", "bn", "<cmd>bn<cr>", { desc = "Next buffer in order" })
utils.map("n", "bp", "<cmd>bp<cr>", { desc = "Prev buffer in order" })
utils.map("n", "b3", "<cmd>b#<cr>", { desc = "Go to previously visited buffer" })

utils.map("n", "<C-b>", "<cmd>lua vim.lsp.buf.definition()<cr>")
utils.map("n", "<C-S-b>", "<cmd>lua vim.lsp.buf.declaration()<cr>")
utils.map("n", "<C-S-r>", "<cmd>lua vim.lsp.buf.references()<cr>")
-- utils.map("n", "<C-h>", "<cmd>lua vim.lsp.buf.hover()<cr>") -- <C-W>D
-- utils.map("n", "<leader>ee", "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<cr>") -- K
utils.map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
utils.map("n", "<C-S-l>", "<cmd>lua vim.lsp.buf.format({ async = false })<cr>")
-- <C-o> is used to go back in the jump list

utils.map("t", "<C-[>", "<C-\\><C-n>", { desc = "Actually defocus terminal on Esc" })
utils.map("t", "<leader>c", "<cmd>lua require('utils').clear_terminal()<cr>", { desc = "Clear terminal and scrollback" })
