-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("n", "<leader>ch", function()
    local hunks = require("gitsigns").get_hunks()
    local format = require("conform").format

    if not hunks or #hunks == 0 then
        vim.notify("No hunks found", vim.log.levels.INFO)
        return
    end

    for i = #hunks, 1, -1 do
        local hunk = hunks[i]
        if hunk ~= nil and hunk.type ~= "delete" then
            local start = hunk.added.start
            local last = start + hunk.added.count
            -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
            local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
            local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
            format({ range = range })
        end
    end

    vim.notify("Formatted " .. #hunks .. " hunk(s)", vim.log.levels.INFO)
end, { desc = "Format all git hunks" })

vim.keymap.set("n", "<leader>sf", function()
    require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
end, { desc = "Search and replace in current file" })
