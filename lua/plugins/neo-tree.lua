local M = require('config.neo-tree')
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true, 
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            's1n7ax/nvim-window-picker',
            version = '*',
            config = function()
                M.setup_window_picker()
            end
        }
    }, 
    cmd = {
        "Neotree", 
    }, 
    keys = {
        {"<C-n>", "<cmd>Neotree toggle<cr>", desc = "Neotree Toggle"},
        {"<leader>e", "<cmd>Neotree reveal<cr>", desc = "Neotree Reveal"}, 
    }, 
    init = function()
        vim.api.nvim_create_autocmd("BufEnter", {
          group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
          desc = "Start Neo-tree with directory",
          once = true,
          callback = function()
            if package.loaded["neo-tree"] then
              return
            else
              local stats = vim.uv.fs_stat(vim.fn.argv(0))
              if stats and stats.type == "directory" then
                require("neo-tree")
              end
            end
          end,
        })
    end, 
    config = function()
        M.setup_neo_tree()
    end 
}
