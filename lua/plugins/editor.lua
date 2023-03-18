local tele_actions = require("telescope.actions")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- replace all keymaps with only one mapping
    keys = function()
      return {
        {
          "<leader>e",
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

      return {
        { "<leader><space>", Util.telescope("files", { cwd = false }) },
        { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
        { "<leader>sa", Util.telescope("live_grep", { cwd = false }) },
      }
    end,
    opts = {
      defaults = {
        layout_config = {
          horizontal = {
            preview_width = 0.6,
            width = 0.9,
            preview_cutoff = 120,
          },
        },
        mappings = {
          i = {
            ["<c-t>"] = tele_actions.select_tab,
            ["<C-j>"] = tele_actions.move_selection_next,
            ["<C-k>"] = tele_actions.move_selection_previous,
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
