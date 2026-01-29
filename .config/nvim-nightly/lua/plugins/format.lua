require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" },
		swift = { "swiftformat" },
	},
})

-- Горячая клавиша для форматирования
vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ lsp_fallback = false })
end)

-- Автоформат по сохранению
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.py", "*.lua", "*.swift" },
	callback = function()
		require("conform").format({ lsp_fallback = false })
	end,
})
