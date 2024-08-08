return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
   keys = {
     { "<leader>nv", "<cmd>Navbuddy<cr>", desc = "Nav" },
   },
  config = function()
    local navbuddy = require("nvim-navbuddy")
 navbuddy.setup({
      lsp = { auto_attach = true },
    })
  end,
}
