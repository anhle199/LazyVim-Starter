return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        always_show_bufferline = false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      opts.sections.lualine_b = {
        "branch",
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
        },
      }
      opts.sections.lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = fg("Statement")
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = fg("Constant") ,
          },
        { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
      }
    end,
  },

  {
    "SmiteshP/nvim-navic",
    enabled = false,
    opts = function()
      return {
        icons = {
          Namespace = " ",
          Package = " ",
          String = " ",
          Number = " ",
          Boolean = "◩ ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = "ﳠ ",
          Copilot = " ",
          Text = "",
          Method = "m",
          Function = "",
          Constructor = "",
          Field = "",
          Variable = "",
          Class = "",
          Interface = "",
          Module = "",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
        },
      }
    end,
  },
}
