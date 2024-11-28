M = {}

M.config = function()
  local dap = require "dap"
  local codelldb = require("mason-registry").get_package("codelldb"):get_install_path() .. "/codelldb"
  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
      command = codelldb,
      args = { "--port", "${port}" },
    },
  }
end

return M
