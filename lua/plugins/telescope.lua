return {
    'nvim-telescope/telescope.nvim',
	lazy = true,
	cmd = "Telescope",
	config = require("config.telescope"),
    branch = '0.1.x', 
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "debugloop/telescope-undo.nvim" },
		{
			"ahmedkhalf/project.nvim",
			event = { "CursorHold", "CursorHoldI" },
	        config = require("config.project")
		},
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-frecency.nvim" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    }, 
    keys = {
        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files"}, 
        {"<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers"}, 
        {"<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Find Words"}
    }
}
