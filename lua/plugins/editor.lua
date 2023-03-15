local Actions = require("telescope.actions")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- replace all keymaps with only one mapping
    keys = function()
      return {
        {
          "<C-n>",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
          end,
        },
      }
    end,
    opts = {
      filesystem = {
        follow_current_file = false,
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      window = {
        width = 36,
        mappings = {
          ["S"] = "none",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
        },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      local Util = require("lazyvim.util")
      local layout_config = {
        width = 0.9,
        preview_cutoff = 120,
        preview_width = 0.6,
      }

      return {
        { "<C-p>", Util.telescope("files", { cwd = false, layout_config = layout_config }) },
        { "<C-l>", Util.telescope("current_buffer_fuzzy_find", { layout_config = layout_config }) },
        { "<leader>a", Util.telescope("live_grep", { cwd = false, layout_config = layout_config }) },
      }
    end,
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<c-t>"] = Actions.select_tab,
            ["<C-j>"] = Actions.move_selection_next,
            ["<C-k>"] = Actions.move_selection_previous,
          },
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return {
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          -- stylua: ignore start
          map("n", "<leader>gb", function() gs.blame_line({ full = true }) end)
          map("n", "<leader>gd", gs.diffthis)
        end,
      }
    end,
  },

  {
    "folke/trouble.nvim",
    keys = function()
      return {
        { "<leader>D", "<cmd>TroubleToggle document_diagnostics<cr>" },
      }
    end,
  },

  { "folke/todo-comments.nvim", enabled = false },
  { "folke/which-key.nvim", enabled = false },
}
