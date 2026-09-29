-- заставить nvim работать с русской раскладкой
vim.opt.langmap = {
	"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ",
	"фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
}

-- vim.keymap.del("n", "<leader>x")

local map = vim.keymap.set

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

-- CMD enter command mode
map("n", ";", ":", { desc = "CMD enter command mode", remap = true })
map("n", "ж", ":", { desc = "CMD enter command mode", remap = true })
map("n", "Ж", ":", { desc = "CMD enter command mode", remap = true })

-- comment toggle
-- Нормальный режим — оставляем gcc
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("n", "<leader>.", "gcc", { desc = "toggle comment", remap = true })

-- Визуальный режим — используем gc, а не gcc
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
map("v", "<leader>.", "gc", { desc = "toggle comment", remap = true })

map("v", "<", "<gv", { noremap = true, desc = "Shift left and stay in visual" })
map("v", ">", ">gv", { noremap = true, desc = "Shift right and stay in visual" })

-- buffer management
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
