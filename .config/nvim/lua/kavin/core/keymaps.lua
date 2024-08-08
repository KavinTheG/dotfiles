vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "ii", "<ESC>", { desc = "Exit insert mode with jk"})


-- window manage
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vert." })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horiz." })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Split window vert." })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Ope new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew<CR>", { desc = "Open current buffer in new tab" })


