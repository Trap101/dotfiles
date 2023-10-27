local transparent = require "transparent"
local base46 = require "base46"
local nvim_create_user_command = vim.api.nvim_create_user_command
local function tranparent_setup()
  if vim.g.transparent_enabled ~= vim.g.transparency then
    base46.toggle_transparency()
  end
end
transparent.setup {
  extra_groups = {
    -- "TelescopeBorder",
    "VertSplit",
    "NormalFloat",
    "FloatBorder",
  },
}
tranparent_setup()
vim.api.nvim_set_hl(0, "NotifyBackground", vim.api.nvim_get_hl_by_name("Normal", true))
local function toggle_transparency(opt)
  if opt == nil then
    local a= vim.g.transparency
    transparent.toggle((a and true))
    base46.toggle_transparency()
    return
  end
  assert(type(opt) == "boolean", "should only include boolean variable for this function")
  if opt == false then
    transparent.toggle(false)
    if vim.g.transparency ~= false then
      base46.toggle_transparency()
    end
  else
    transparent.toggle(true)
    if vim.g.transparency ~= true then
      base46.toggle_transparency()
    end
  end
end

nvim_create_user_command("TransparentEnable", function()
  toggle_transparency(true)
end, {})
nvim_create_user_command("TransparentDisable", function()
  toggle_transparency(false)
end, {})
nvim_create_user_command("TransparentToggle", function()
  toggle_transparency()
end, {})
