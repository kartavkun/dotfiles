vim.pack.add({
	{ src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },
	{ src = 'https://github.com/iamcco/markdown-preview.nvim' }
})

require("render-markdown").setup()

-- Ограничиваем плагин markdown-файлами
vim.g.mkdp_filetypes = { "markdown" }

-- Подгружаем плагин только для markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.cmd("packadd markdown-preview.nvim")
	end,
})
