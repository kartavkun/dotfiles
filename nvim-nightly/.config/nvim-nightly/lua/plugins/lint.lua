local lint = require("lint")

lint.linters_by_ft = {
	python = { "pylint" }, -- или {"ruff"} если хочешь ruff
	lua = { "luacheck" },
	swift = { "swiftlint" },
}

-- Линтинг после сохранения
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.py", "*.lua", "*.swift" },
	callback = function()
		lint.try_lint()
	end,
})
