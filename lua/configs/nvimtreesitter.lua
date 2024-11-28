return {
  ensure_installed = {
    "c",
    "cpp",
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "javascript",
    "typescript",
    "python",
    "rust",
    "bash",
    "haskell",
  },

  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "g;", -- set to `false` to disable one of the mappings
      node_incremental = "g;",
      scope_incremental = false,
      node_decremental = "g,",
    },
  },
}
