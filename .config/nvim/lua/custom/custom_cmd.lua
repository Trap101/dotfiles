local create_user_command = vim.api.nvim_create_user_command
local del_user_command = vim.api.del_user_command
create_user_command("Enc", "WorkSpaceOpen nvim_config", {})
create_user_command("Linuxify"," :%s/\r$//g",{})
create_user_command("Dismiss", function ()
  require("notify").dismiss()
end,{})
create_user_command("Diagnostic",function ()
  vim.diagnostic.setloclist()
end,{}
)
-- plugin specific ones
