return {
    "hrsh7th/nvim-cmp", 
    dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp", 
		"kdheepak/cmp-latex-symbols",
        "williamboman/mason.nvim", 
        "williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
        require('config.nvim-cmp')
        require('config.lsp')
    end
}

