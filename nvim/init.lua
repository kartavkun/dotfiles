require("config.options")
require("config.keymaps")
-- require("config.autocmds")

local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for name, type in vim.fs.dir(plugins_dir) do
	if type == "file" and name:match("%.lua$") then
		require("plugins." .. name:gsub("%.lua$", ""))
	end
end
