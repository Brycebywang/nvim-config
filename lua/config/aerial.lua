return function()
	require("aerial").setup({
        attach_mode = "global", 
		close_on_select = true,
		highlight_on_jump = false,
		disable_max_lines = 8500,
		disable_max_size = 1000000,
		ignore = { filetypes = { "NvimTree", "terminal", "nofile" } },
		-- Use symbol tree for folding. Set to true or false to enable/disable
		-- Set to "auto" to manage folds if your previous foldmethod was 'manual'
		-- This can be a filetype map (see :help aerial-filetype-map)
		manage_folds = "auto",
		layout = {
            resize_to_content = false,
            win_opts = {
                winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
                signcolumn = "yes",
                statuscolumn = " ",
            },
        }, 
		filter_kind = {
			"Array",
			"Boolean",
			"Class",
			"Constant",
			"Constructor",
			"Enum",
			"EnumMember",
			"Event",
			"Field",
			"File",
			"Function",
			"Interface",
			"Key",
			"Method",
			"Module",
			"Namespace",
			"Null",
			-- "Number",
			"Object",
			"Operator",
			"Package",
			-- "Property",
			-- "String",
			"Struct",
			-- "TypeParameter",
			-- "Variable",
		},
	})
end
