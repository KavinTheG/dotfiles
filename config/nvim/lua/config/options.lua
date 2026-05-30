-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- -- Set cursor shapes
vim.opt.guicursor = {
    "n-v-c:block", -- Normal, visual, command: block cursor
    "i-ci-ve:ver25", -- Insert, command insert, visual exclusive: vertical bar (25% width)
    "r-cr:hor20", -- Replace, command replace: horizontal bar (20% height)
    "o:hor50", -- Operator-pending: horizontal bar (50% height)
    "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blink timing
}
