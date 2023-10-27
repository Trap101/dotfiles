local M = {}

M.treesitter = {
  ensure_installed = {
    "python",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "rust",
    "toml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "svelte-language-server",
    "astro-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    -- python stuff
    "pyright",
    "black",
    "yapf",
    "ruff",

    --rust
    "codelldb",
    --bash
    "bash-language-server",
    "beautysh",
    
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
}
M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    -- {
    --   name = "spell",
    --   option = {
    --     keep_all_entries = false,
    --     enable_in_context = function()
    --       return true
    --     end,
    --   },
    -- },
    -- {
    --   name="dictionary",
    --   keyword_length=2,
    -- },
  },
}
M.telescope={

}
return M
