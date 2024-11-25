-- language server manager
return {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },

	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "clangd", "basedpyright" },
		})
	end,
}
