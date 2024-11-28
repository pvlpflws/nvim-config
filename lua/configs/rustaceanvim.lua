M = {}

M.on_attach = function(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)

  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)

  vim.keymap.set("n", "<leader>ca", function()
    vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  end, { silent = true, buffer = bufnr })

  vim.keymap.set(
    "n",
    "gh", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
    function()
      vim.cmd.RustLsp { "hover", "actions" }
    end,
    { silent = true, buffer = bufnr }
  )

  vim.keymap.set("n", "<leader>dpr", "<CMD>RustLsp debuggables<CR>", { desc = "Test Method" })
end

M.dap = function()
  local extension_path = vim.fn.stdpath "data" .. "mason/packages/codelldb/extension/"
  local codelldb_path = extension_path .. "adapter/codelldb"
  local liblldb_path = extension_path .. "lldb/lib/liblldb"
  local this_os = vim.uv.os_uname().sysname .. ""

  -- The path is different on Windows
  if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
  else
    -- The liblldb extension is .so for Linux and .dylib for MacOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

  local cfg = require "rustaceanvim.config"
  return {
    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  }
end

return M
