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
local servers = { "lua_ls", "html", "cssls", "bashls", "ts_ls", "hls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = M.on_attach,
    on_init = M.on_init,
    capabilities = M.capabilities,
  }
end

-- python
lspconfig.basedpyright.setup {
  on_attach = function(client, bufnr)
    M.on_attach(client, bufnr)
    vim.keymap.set("n", "<leader>dpr", ":lua require('dap-python').test_method()<CR>", { desc = "Test Method" })
  end,
  capabilities = M.capabilities,
  filetypes = { "python" },
  settings = {
    basedpyright = {
      disableOrganizeImports = true, -- Using Ruff
      typeCheckingMode = "standard",
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "standard",
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
