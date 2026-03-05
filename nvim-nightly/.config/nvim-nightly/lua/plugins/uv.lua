require("uv").setup({})

local map = vim.keymap.set
map("n", "<leader>xr", function()
	vim.cmd("write")
	require("uv").run_file()
end, { desc = "Run file" })
