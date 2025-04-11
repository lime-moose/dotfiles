return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup({
            options = {
                separator_style = "slope",
                mode = "tabs",
                diagnostics = "nvim_lsp",
            },
        })
    end,
}
