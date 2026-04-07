vim.pack.add({
	{ src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range("1.*")  },
	{ src = 'https://github.com/akinsho/bufferline.nvim' },
	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	-- { src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/iamcco/markdown-preview.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/andweeb/presence.nvim" },
	{ src = "https://github.com/loctvl842/monokai-pro.nvim" },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/nvim-mini/mini.surround" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/benomahony/uv.nvim" },
	{ src = "https://github.com/3rd/image.nvim" }
})

require('plugins.blink')
require('plugins.bufferline')
require('plugins.format')
require('plugins.lint')
require('plugins.lsp')
require('plugins.lualine')
-- require('plugins.noice')
require('plugins.nvim-tree')
require('plugins.pairs')
require('plugins.previewmd')
require('plugins.rendermd')
require('plugins.rpc')
require('plugins.monokai')
require('plugins.supermaven')
require('plugins.surround')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.uv')
require('plugins.image')
