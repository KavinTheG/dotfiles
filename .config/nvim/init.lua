-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_keymap("i", "ii", "<Esc>", { noremap = true, silent = true })
vim.opt.termguicolors = true
-- vim.opt.guicursor = ""
vim.opt.guicursor = "a:ver25-blinkon0"

-- In your nvim config (~/.config/nvim/init.lua)
-- vim.api.nvim_exec(
--     [[
--   augroup wezterm_font
--     autocmd!
--     autocmd VimEnter * let $WEZTERM_PROG="nvim"
--     autocmd VimLeave * let $WEZTERM_PROG=""
--   augroup END
-- ]],
--     false
-- )

vim.filetype.add({
    extension = {
        mir = "mir",
    },
})
