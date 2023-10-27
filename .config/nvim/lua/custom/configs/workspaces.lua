local sessions = require("sessions")
local session_path = ".nvim/session"
sessions.setup(
  {
     session_filepath = session_path,
  }
)
local workspaces = require("workspaces")
workspaces.setup({
  {
    hooks = {
        open = function()
          sessions.load(nil, { silent = false })
        end,
    }
  }
})

