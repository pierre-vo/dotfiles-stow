-- overriding default plugin configs!

local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "fish",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "yaml",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  view = {
    side = "left",
    width = 30,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  extensions = {
    -- fd is needed
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
    },
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return M
