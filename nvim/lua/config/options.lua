vim.g.mapleader = " "
vim.o.nu = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
-- vim.o.colorcolumn = "80"
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
-- vim.g.loaded_netrwPlugin = 1

-- Файл для хранения истории
vim.o.history = 1000 -- сколько команд хранить
vim.o.undofile = true -- включаем persistent undo
vim.o.undodir = vim.fn.stdpath("data") .. "/undo" -- куда сохранять undo

vim.diagnostic.config({ virtual_text = true })
