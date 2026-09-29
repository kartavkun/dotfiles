vim.pack.add({
	{ src = 'https://github.com/akinsho/bufferline.nvim' }
})
require("bufferline").setup({
	options = {
		always_show_bufferline = false,
	}
})
