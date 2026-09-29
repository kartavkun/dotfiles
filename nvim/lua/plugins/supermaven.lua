vim.pack.add({
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
})

require("supermaven-nvim").setup({
	disable_inline_completion = true,
	disable_keymaps = true,
})
