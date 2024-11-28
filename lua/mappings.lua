require "nvchad.mappings"

local map = vim.keymap.set

map({ "i", "v" }, "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-u>", "<C-u>zz")
map({ "n", "i", "v" }, "<C-d>", "<C-d>zz")

map("i", "jj", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

map({ "n", "i", "v" }, "zm", ":ZenMode<CR>", { desc = "Zen Mode" })

map("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
map("n", "dac", ":DapContinue<CR>", { desc = "DAP Continue" })
map("n", "din", ":DapStepInto<CR>", { desc = "DAP Step Into" })
map("n", "dou", ":DapStepOut<CR>", { desc = "DAP Step Out" })
map("n", "dov", ":DapStepOver<CR>", { desc = "DAP Step Over" })
map("n", "dat", ":DapTerminate<CR>", { desc = "DAP Terminate" })


map("n", "<leader>dv", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
map("n", "<leader>dvc", ":DiffviewClose<CR>", { desc = "Diffview Close" })

map("n", "<leader>tr", ":Telescope resume<CR>", { desc = "Resume Last Telescope" })

map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
map("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
map("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

map("n", "<leader>ih", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", {
  desc = "Toggle Inlay Hints",
})
