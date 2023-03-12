local Util = require("lazyvim.util")
local Actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- new
    { "<C-p>", Util.telescope("files"), desc = "Find Files (root dir)" },
    { "<C-l>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>gd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },

    -- disables default mappings
    { "<leader>,", false },
    { "<leader>:", false },
    { "<leader><space>", false },
    { "<leader>fb", false },
    { "<leader>ff", false },
    { "<leader>fF", false },
    { "<leader>fr", false },
    { "<leader>sb", false },
    { "<leader>sd", false },
    { "<leader>sg", false },
    { "<leader>sG", false },
  },
  opts = {
    defaults = {
      layout_config = {
        width = 0.9,
        preview_cutoff = 120,
        preview_width = 0.6,
      },
      mappings = {
        i = {
          ["<C-j>"] = Actions.move_selection_next,
          ["<C-k>"] = Actions.move_selection_previous,
        },
      },
    },
  },
}
