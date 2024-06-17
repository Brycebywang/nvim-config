local M = require('config.neo-tree')
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            's1n7ax/nvim-window-picker',
            version = '2.*',
            config = function()
                M.setup_window_picker()
            end
        }
    }, 
    config = function()
        M.setup_neo_tree()
    end 
}
