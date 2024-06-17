return {
    "nvim-treesitter/nvim-treesitter", 
    lazy = true,
	build = function()
		if #vim.api.nvim_list_uis() ~= 0 then
			vim.api.nvim_command([[TSUpdate]])
		end
	end,
	event = "BufReadPre",
	config = require("config.treesitter"),
	dependencies = {
		{ "andymass/vim-matchup" },
		{ "mfussenegger/nvim-treehopper" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{
			"NvChad/nvim-colorizer.lua",
		},
		{
			"hiphish/rainbow-delimiters.nvim",
			config = require("config.rainbow_delims"),
		},
		{
			"nvim-treesitter/nvim-treesitter-context",
			config = require("config.ts-context"),
		},
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = require("config.ts-context-commentstring"),
		},
	}
}

