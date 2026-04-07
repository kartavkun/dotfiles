-- заставить nvim работать с русской раскладкой
vim.opt.langmap = {
  'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  'фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz',
}

local map = vim.keymap.set

-- CMD enter command mode
map('n', ';', ':', { desc = 'CMD enter command mode', remap = true })
map('n', 'ж', ':', { desc = 'CMD enter command mode', remap = true })
map('n', 'Ж', ':', { desc = 'CMD enter command mode', remap = true })

-- comment toggle
-- Нормальный режим — оставляем gcc
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('n', '<leader>.', 'gcc', { desc = 'toggle comment', remap = true })

-- Визуальный режим — используем gc, а не gcc
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })
map('v', '<leader>.', 'gc', { desc = 'toggle comment', remap = true })

map('v', '<', '<gv', { noremap = true, desc = "Shift left and stay in visual" })
map('v', '>', '>gv', { noremap = true, desc = "Shift right and stay in visual" })

-- buffer management
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>z", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })

-- base commands
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>ц", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>й", "<cmd>q<cr>")
map("n", "<leader>wq", "<cmd>wq<cr>")
map("n", "<leader>цй", "<cmd>wq<cr>")

-- файловый менеджер
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
-- map("n", "<leader>е", "<cmd>NvimTreeToggle<cr>")

vim.keymap.set("n", "<leader>t", function()
  vim.cmd("split")
  vim.fn.termopen("/bin/zsh", {
    cwd = vim.fn.expand("%:p:h"),
  })
  vim.cmd("startinsert")
end)
