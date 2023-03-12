-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("i", "jk", "<esc>", { desc = "Exit insert mode" })
map("v", "<BS>", '"_d', { noremap = true, silent = true }) -- Enable backspace to delete selected area

map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })

--------------------------------------------------------------------
-- Disables default keymaps

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<Nop>")
map("n", "<C-j>", "<Nop>")
map("n", "<C-k>", "<Nop>")
map("n", "<C-l>", "<Nop>")

-- Move Lines
map("n", "<A-j>", "<Nop>")
map("n", "<A-k>", "<Nop>")
map("i", "<A-j>", "<Nop>")
map("i", "<A-k>", "<Nop>")
map("v", "<A-j>", "<Nop>")
map("v", "<A-k>", "<Nop>")
