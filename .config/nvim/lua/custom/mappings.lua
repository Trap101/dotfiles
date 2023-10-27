---@type MappingsTable
local M = {}
M.disabled = {
  n = {
    ["<leader>q"] = "",
    ["<leader>f"] = "",
  },
}
M.general = {
  l = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<C-c>"] = { "<ESC>", "leave insert mode while retaining normal features" },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>sv"] = { "<cmd> vsplit <CR>", "vertical split current window" },
    ["<leader>sh"] = { "<cmd> split <CR>", "horizontal split split current window" },
    ["<leader>sx"] = { "<cmd> close <CR>", "close splitted window" },
    ["n"] = { "nzzzv", "keep cursor in center when selecting" },
    ["N"] = { "Nzzzv", "keep cursor in center when selecting backward" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "select and move item up" },
    ["K"] = { ":m '<-2<CR>gv=gv", "select and move item down" },
    ["<C-c>"] = { "<ESC>", "leave insert mode while retaining normal features" },
  },
}
M.lspconfig={
  n={
    ["<leader>fd"]={
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    }
  }
}
M.rt = {
  plugin = true,
  n = {
    ["<Leader>k"] = {
      function()
        require("rust-tools").hover_actions.hover_actions()
      end,
      "rust tools hover actions",
    },
  },
}
M.telescope = {
  n = {
    ["<Leader>fs"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Find workspace symbols" },
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<Leader>dt"] = {
      "<cmd>DapToggleBreakpoint<CR>",
      "dap toggle breakpoint",
    },
    ["<Leader>dx"] = {
      "<cmd>DapTerminate<CR>",
      "Terminate dap",
    },
    ["<Leader>do"] = {
      "<cmd>DapStepOver<CR>",
      "Dap stepover",
    },
    ["<Leader>di"] = {
      "<cmd>DapStepIn<CR>",
      "Dap step in",
    },
  },
}
M.comment = {
  n = {
    ["<c-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },
  i = {
    ["<c-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
     end,
      "Toggle comment",
    },
  },

  v = {
    ["<c-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}
M.folding = {
  plugin = true,
  n = {
    ["zR"] = {
      function()
        require("ufo").openAllFolds()
      end,
      "Open all folds with ufo",
    },
    ["zM"] = {
      function()
        require("ufo").closeAllFolds()
      end,
      "Close all folds with ufo",
    },
  },
}
M.code_runner={
  plugin=true,
  n={
    ["<leader>rc"]={
      "<cmd>RunCode<CR>",
      "run code using code runner"
    },
    ["<leader>rf"]={
      "<cmd>RunFile<CR>",
      "run file using code runner"
    },
    ["<leader>rp"]={
      "<cmd>RunProject<CR>",
      "run project using code runner"
    }
  }
}
-- more keybinds!

return M
