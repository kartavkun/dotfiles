-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.opt.langmap = {
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ",
  "фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
}

local map = vim.keymap.set

-- CMD enter command mode
map("n", ";", ":", { desc = "CMD enter command mode", remap = true })
map("n", "ж", ":", { desc = "CMD enter command mode", remap = true })
map("n", "Ж", ":", { desc = "CMD enter command mode", remap = true })

-- comment toggle
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gcc", { desc = "toggle comment", remap = true })

-- buffer management
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Error diagnostics" })
map("n", "<leader>ав", "<cmd>Telescope diagnostics<cr>", { desc = "Error diagnostics" })

-- terminal
map("n", "<leader>h", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
map("n", "<leader>р", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

map("n", "<leader>x", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>ч", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- uv
local uv = require("uv")
map("n", "<leader>xr", function()
  vim.cmd("write")
  uv.run_file()
end, { desc = "Run File" })
