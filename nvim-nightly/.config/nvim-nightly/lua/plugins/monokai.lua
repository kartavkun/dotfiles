vim.o.termguicolors = true
vim.o.background = 'dark'
require("monokai-pro").setup({
	filter = "classic"
})
vim.cmd.colorscheme("monokai-pro")
