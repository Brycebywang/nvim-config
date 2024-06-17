return {
    "stevearc/aerial.nvim", 
    lazy = true,
    event = "LspAttach", 
    keys = {
        {"<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)"}, 
    }, 
	config = require("config.aerial")
}
