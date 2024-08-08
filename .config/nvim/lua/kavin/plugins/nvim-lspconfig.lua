return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "SmiteshP/nvim-navbuddy",
            dependiencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            },
            opts = { lsp = { auto_attach = true } }
        }
    },
    
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.tsserver.setup {}
      lspconfig.rust_analyzer.setup {
        settings = {
          ['rust-analyzer'] = {},
        },
      }
    end
}
