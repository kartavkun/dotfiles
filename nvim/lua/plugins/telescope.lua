vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("telescope").setup({})

local map = vim.keymap.set
map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Telescope find files" })

map("n", "<leader><leader>", function()
	require("telescope.builtin").find_files()
end, { desc = "Telescope find files" })
