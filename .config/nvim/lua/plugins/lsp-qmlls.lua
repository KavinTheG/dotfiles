return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            qmlls = {
                cmd = { "qmlls6" },
                filetypes = { "qml" },
                root_dir = require("lspconfig.util").root_pattern(".git", "."),
            },
        },
    },
}
