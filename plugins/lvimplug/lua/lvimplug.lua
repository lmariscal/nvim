-- Copyright Leonardo Mariscal, 2018 All rights reserved.

local nvim = vim.api
local lvimplug = {}

lvimplug.test = function ()
  nvim.nvim_out_write("NeoVim Version: 5.1\n")
end

return lvimplug

