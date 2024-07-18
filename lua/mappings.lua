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
map("n", "<leader>dpr", ":lua require('dap-python').test_method()<CR>", { desc = "Test Method" })

map("n", "<leader>dv", ":DiffviewOpen<CR>", { desc = "Diffview Open" })
map("n", "<leader>dvc", ":DiffviewClose<CR>", { desc = "Diffview Close" })


