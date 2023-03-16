-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.mouse = ""
vim.opt.backspace = { "start", "eol", "indent" } -- Enable 'Backspace' key in insert mode
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.timeoutlen = 500

--------------------------------------------------
-- Processing file

-- Creates a backup file
vim.opt.backup = false
-- Creates a backup file while it is being edited. The backup is removed after the file was successfully written
vim.opt.writebackup = true
vim.opt.swapfile = true

-- Persistent undo (true: enable, false: disable)
-- enable: you are able to undo file after it is closed
vim.opt.undofile = false
