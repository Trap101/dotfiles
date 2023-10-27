-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
require 'custom.options'
require "custom.custom_cmd"
-- set noexpandtab
-- set tabstop=4
-- set shiftwidth=4
-- vim.cmd("set noexpandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set shiftwidth=4")

-- set noexpandtab
-- set tabstop=4
-- set shiftwidth=4
-- vim.cmd("set noexpandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set shiftwidth=4")

local cmp_enabled = true
vim.api.nvim_create_user_command("ToggleAutoComplete", function()
  if cmp_enabled then
    require("cmp").setup.buffer({ enabled = false })
    cmp_enabled = false
  else
    require("cmp").setup.buffer({ enabled = true })
    cmp_enabled = true
  end
end, {})
vim.cmd("au BufNewFile,BufRead *.wgsl set filetype=wgsl")
local enable_providers = {
      "python3_provider",
      "node_provider",
      -- and so on
    }
    
for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
