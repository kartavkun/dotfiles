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
-- Rust LSP (rust-analyzer)
-- =========================
vim.lsp.config('rust_analyzer', {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	root_markers = { 'Cargo.toml' }
})
vim.lsp.enable('rust_analyzer')

-- =========================
-- Markdown LSP (marksman)
-- =========================
vim.lsp.config('marksman', {})
vim.lsp.enable('marksman')
