return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local configs = require("lspconfig.configs")

            if not configs.mojo_lsp then
                configs.mojo_lsp = {
                    default_config = {
                        cmd = { "mojo-lsp-server" },
                        filetypes = { "mojo" },
                        root_dir = function(fname)
                            local root = vim.fs.find(".git", { path = fname, upward = true })[1]
                            return root and vim.fs.dirname(root) or vim.loop.cwd()
                        end,
                        single_file_support = true,
                    },
                    docs = {
                        description = [[
https://github.com/modularml/mojo
`mojo-lsp-server` can be installed via Modular: https://developer.modular.com/download
Mojo is a new programming language that bridges the gap between research and production by combining Python syntax and ecosystem with systems programming and metaprogramming features.
                        ]],
                    },
                }
            end

            lspconfig.mojo_lsp.setup({})
        end,
    },

    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                mojo = { "mojo" },
            },
            formatters = {
                mojo = {
                    command = "/home/kavin/Github/gpu-intro/.pixi/envs/default/bin/mojo",
                    args = { "format", "-" },
                    stdin = true,
                },
            },
            format_on_save = true,
        },
    },
}
