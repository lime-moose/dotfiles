--- Nvim-lspconfig (lsp configuration) ---
return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		--- Lsp Configurations ---
		lspconfig.lua_ls.setup({}) -- lua
		lspconfig.clangd.setup({}) -- c/c++
		lspconfig.bashls.setup({}) -- bash
		lspconfig.tsserver.setup({}) -- js/ls
		lspconfig.html.setup({}) -- html
		lspconfig.cssls.setup({}) -- css
	end,
}
