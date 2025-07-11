-- settings for lsp servers
return {
	"neovim/nvim-lspconfig",
	config = function()
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").clangd.setup({})
		require("lspconfig").basedpyright.setup({})
	end,
}
