vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
-- vim.opt.colorcolumn = "80"
vim.opt.winborder = "rounded"
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
-- vim.g.loaded_netrwPlugin = 1

-- Файл для хранения истории
vim.opt.history = 1000           -- сколько команд хранить
vim.opt.undofile = true           -- включаем persistent undo
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'  -- куда сохранять undo

-- пример: сохраняем и загружаем сессии
-- vim.cmd([[
--   autocmd VimLeavePre * mksession! ~/.config/nvim/session.vim
--   autocmd VimEnter * source ~/.config/nvim/session.vim
-- ]])

