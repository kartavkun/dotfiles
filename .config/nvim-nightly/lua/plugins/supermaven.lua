require("supermaven-nvim").setup({
	condition = function()
		return string.match(vim.fn.expand("%:t"), ".md")
	end,
})
