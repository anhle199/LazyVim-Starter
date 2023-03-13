-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--------------------------------------------------------------------
-- Unmap unnecessary keymaps
local unmap = vim.api.nvim_del_keymap

-- Save file
unmap("i", "<C-s>")
unmap("v", "<C-s>")
unmap("n", "<C-s>")
-- unmap("s", "<C-s>")

-- Move to window using the <ctrl> hjkl keys
unmap("n", "<C-h>")
unmap("n", "<C-j>")
unmap("n", "<C-k>")
unmap("n", "<C-l>")

-- -- Move Lines
unmap("n", "<A-j>")
unmap("n", "<A-k>")
unmap("i", "<A-j>")
unmap("i", "<A-k>")
unmap("v", "<A-j>")
unmap("v", "<A-k>")

-- windows
unmap("n", "<leader>ww")
unmap("n", "<leader>wd")
unmap("n", "<leader>w-")
unmap("n", "<leader>w|")
unmap("n", "<leader>-")
unmap("n", "<leader>|")

-- tabs
unmap("n", "<leader><tab>l")
unmap("n", "<leader><tab>f")
unmap("n", "<leader><tab><tab>")
unmap("n", "<leader><tab>]")
unmap("n", "<leader><tab>d")
unmap("n", "<leader><tab>[")

-- buffers
unmap("n", "<S-h>")
unmap("n", "<S-l>")
unmap("n", "[b")
unmap("n", "]b")

--------------------------------------------------------------------
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

map("i", "jk", "<esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
map("v", "<BS>", '"_d', { noremap = true, silent = true }) -- Enable backspace to delete selected area

map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

local Util = require("lazyvim.util")
if Util.has("bufferline.nvim") then
  map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
