local M = {}

M.on_init = require("nvchad.configs.lspconfig").on_init
M.capabilities = require("nvchad.configs.lspconfig").capabilities

M.on_attach = function(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)

  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts "Go to type definition")
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts "hover information")
end

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "bashls", "ts_ls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = M.on_attach,
    on_init = M.on_init,
    capabilities = M.capabilities,
  }
end

-- python
lspconfig.pyright.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = { "python" },
  settings = {
    pyright = {
      disableOrganizeImports = true, -- Using Ruff
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        -- ignore = { "*" }, -- Using Ruff
        typeCheckingMode = "strict", -- Using mypy
      },
    },
  },
}

lspconfig.ruff.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  filetypes = { "python" },
  cmd = { "ruff", "server", "--config", "line-length=120" },
}

lspconfig.clangd.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

return M
