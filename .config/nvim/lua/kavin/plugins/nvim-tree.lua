return {
  "nvim-tree/nvim-tree.lua",
  depndencies = "nvim-tree/nvim-web-devicons",
  config = function() 
    local nvimtree = require("nvim-tree")
    
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true
      },

      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      
      filters = {
        custom = { ".DS_Store" },
      },

      git = {
        ignore = false,
      },
    })    

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Nvim tree toggle to file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Nvim tree collapse" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh" })
    

  end
}
