local rt = require "rust-tools"
local mason_registry = require "mason-registry"

local codelldb = mason_registry.get_package "codelldb"
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local util = require "lspconfig/util"
local server = {
  on_attach = function(client, bufnr)
    require("core.utils").load_mappings("rt", { buffer = bufnr })
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave={
        command="clippy",
      },
      trace={
        server="verbose",
      }
    },
  },
}
local dap = {
  adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
}
local tools = {
  hover_actions = {
    auto_focus = true,
  },
}
rt.setup {
  dap = dap,
  server = server,
  tools = tools,
}
