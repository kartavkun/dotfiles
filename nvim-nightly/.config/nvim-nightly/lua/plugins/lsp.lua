-- Теперь мы используем встроенный API вместо require('lspconfig')
-- Это обеспечит нативную поддержку и более быструю загрузку

-- =========================
-- Lua LSP
-- =========================
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})
vim.lsp.enable('lua_ls')

-- =========================
-- Python LSP (pyright)
-- =========================
vim.lsp.config('pyright', {
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
})
vim.lsp.enable('pyright')

-- =========================
-- Swift LSP (sourcekit)
-- =========================
vim.lsp.config('sourcekit', {
	cmd = { "xcrun", "sourcekit-lsp" },
})
vim.lsp.enable('sourcekit')

-- =========================
-- Marksman LSP (Markdown)
-- =========================
-- vim.lsp.config('marksman', {
--   cmd = { 'marksman', 'server' },
--   filetypes = { 'markdown', 'markdown.mdx' },
--   root_markers = { '.marksman.toml', '.git' },
-- })
vim.lsp.enable('marksman')
