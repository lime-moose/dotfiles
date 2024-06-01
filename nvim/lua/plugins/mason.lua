--- Mason (Lsp Installer) ---
return {
	"williamboman/mason.nvim",
	dependencies = {
		"rshkarin/mason-nvim-lint", -- lint autoinstaller
		"williamboman/mason-lspconfig.nvim", -- lsp autoinstaller
	},

	config = function()
		require("mason").setup()
		--- Mason-lspconfig ---
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "clangd", "bashls", "tsserver", "html", "cssls" },
		})
		--- Mason-nvim-lint ---
		require("mason-nvim-lint").setup({
			ensure_installed = { "stylua", "eslint_d", "prettierd" },
		})
	end,
}
