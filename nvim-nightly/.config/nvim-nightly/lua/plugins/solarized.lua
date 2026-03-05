vim.o.termguicolors = true
vim.o.background = 'dark'
require("solarized").setup({
	transparent = {
		enabled = true,   -- Master switch to enable transparency
		pmenu = true,     -- Popup menu (e.g., autocomplete suggestions)
		normal = true,    -- Main editor window background
		normalfloat = true, -- Floating windows
		neotree = true,   -- Neo-tree file explorer
		nvimtree = true,  -- Nvim-tree file explorer
		whichkey = true,  -- Which-key popup
		telescope = true, -- Telescope fuzzy finder
		lazy = true,      -- Lazy plugin manager UI
		mason = true,     -- Mason manage external tooling
	},
})
vim.cmd.colorscheme("solarized")
