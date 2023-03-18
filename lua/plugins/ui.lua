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
      opts.sections.lualine_z = {
        function()
          return " " .. os.date("%Y-%m-%d %H:%M:%S")
        end,
      }
    end,
  },

  { "SmiteshP/nvim-navic", enabled = false },

  {
    "goolord/alpha-nvim",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
       █████╗ ███╗   ██╗██╗  ██╗    ██╗     ███████╗
      ██╔══██╗████╗  ██║██║  ██║    ██║     ██╔════╝
      ███████║██╔██╗ ██║███████║    ██║     █████╗  
      ██╔══██║██║╚██╗██║██╔══██║    ██║     ██╔══╝  
      ██║  ██║██║ ╚████║██║  ██║    ███████╗███████╗
      ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝    ╚══════╝╚══════╝
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "z  Lazy", ":Lazy<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }
    end,
  },
}
