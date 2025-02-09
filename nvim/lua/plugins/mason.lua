-- language server manager
return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "jay-babu/mason-null-ls.nvim" },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "clangd", "basedpyright" },
        })

        require("mason-null-ls").setup({
            ensure_installed = { "stylua" }
        })
    end,
}
