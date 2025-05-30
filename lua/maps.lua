local utils = require("utils")

-- Default leader key in NeoVim is '\'

utils.map("n", "bn", "<cmd>bn<cr>")
utils.map("n", "bp", "<cmd>bp<cr>")
utils.map("n", "b3", "<cmd>b#<cr>")

utils.map("n", "<C-b>", "<cmd>lua vim.lsp.buf.definition()<cr>")
utils.map("n", "<C-S-b>", "<cmd>lua vim.lsp.buf.declaration()<cr>")
utils.map("n", "<C-S-r>", "<cmd>lua vim.lsp.buf.references()<cr>")
-- utils.map("n", "<C-h>", "<cmd>lua vim.lsp.buf.hover()<cr>") -- <C-W>D
-- utils.map("n", "<leader>ee", "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<cr>") -- K
utils.map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
utils.map("n", "<C-S-l>", "<cmd>lua vim.lsp.buf.format({ async = false })<cr>")
-- <C-o> is used to go back in the jump list

utils.map("t", "<C-[>", "<C-\\><C-n>")
