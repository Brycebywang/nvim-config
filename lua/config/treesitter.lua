return vim.schedule_wrap(function()
	local use_ssh = true

	vim.api.nvim_set_option_value("foldmethod", "expr", {})
	vim.api.nvim_set_option_value("foldexpr", "nvim_treesitter#foldexpr()", {})
    vim.opt.foldenable = false

	require("nvim-treesitter").setup({
		ensure_installed = {
            "bash", 
            "c", 
            "cpp", 
            "go", 
            "json", 
            "latex", 
            "lua", 
            "markdown", 
            "python", 
            "yaml"
        }, 
		highlight = {
			enable = true,
			disable = function(ft, bufnr)
				if vim.tbl_contains({ "vim" }, ft) then
					return true
				end

				local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
				return ok and is_large_file
			end,
			additional_vim_regex_highlighting = false,
		},
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]["] = "@function.outer",
					["]m"] = "@class.outer",
				},
				goto_next_end = {
					["]]"] = "@function.outer",
					["]M"] = "@class.outer",
				},
				goto_previous_start = {
					["[["] = "@function.outer",
					["[m"] = "@class.outer",
				},
				goto_previous_end = {
					["[]"] = "@function.outer",
					["[M"] = "@class.outer",
				},
			},
		},
		indent = { enable = true },
		matchup = { enable = true },
	})
	require("nvim-treesitter.install").prefer_git = true
	if use_ssh then
		local parsers = require("nvim-treesitter.parsers").get_parser_configs()
		for _, p in pairs(parsers) do
			p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
		end
	end
end)
