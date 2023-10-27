local scretch = require("scretch")
local config = {
    scretch_dir = vim.fn.stdpath('config') .. '/scretch/', -- will be created if it doesn't exist
    default_name = "scretch_",
    default_type = "md", -- default unnamed Scretches are named "scretch_*.txt"
    split_cmd = "vsplit", -- vim split command used when creating a new Scretch
    backend = "telescope.builtin" -- also accpets "fzf-lua"
}
scretch.setup(config); 
