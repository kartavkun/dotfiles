vim.pack.add({
	{ src = 'https://github.com/nvim-mini/mini.surround' },
	{ src = 'https://github.com/nvim-mini/mini.pairs' },
	{ src = 'https://github.com/nvim-mini/mini.ai' }
})

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.ai").setup()
