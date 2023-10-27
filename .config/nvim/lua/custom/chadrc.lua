---@type ChadrcConfig
local M = {}

-- eath to overriding theme and highlights files
local highlights = require "custom.highlights"
local word_count_ft = { "markdown", "tex", "txt", "latex" }
M.ui = {
  theme = "oxocarbon",
  theme_toggle = { "oxocarbon" },
  transparency = vim.g.transparent_enabled,
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    enabled = true,
    show_numbers = true,
  },
  extended_integrations={
    "notify",
    "dap"
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
