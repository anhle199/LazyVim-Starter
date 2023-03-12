return {
  "nvim-neo-tree/neo-tree.nvim",
  -- replace all neo-tree keymaps with only one mapping
  keys = {
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<C-n>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
  },
}
