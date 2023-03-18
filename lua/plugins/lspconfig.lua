return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      local format = require("lazyvim.plugins.lsp.format").format

      -- disabled
      keys[#keys + 1] = { "<leader>cd", false }
      keys[#keys + 1] = { "<leader>cf", false }
      keys[#keys + 1] = { "<leader>cf", false, mode = "v" }

      -- new
      keys[#keys + 1] = { "<leader>d", vim.diagnostic.open_float, has = "documentFormatting" }
      keys[#keys + 1] = { "<leader>f", format, has = "documentFormatting" }
      keys[#keys + 1] = { "<leader>f", format, mode = "v", has = "documentRangeFormatting" }
    end,
    opts = {
      diagnostics = {
        underline = false,
        virtual_text = false,
        float = {
          focusable = true,
          style = "minimal",
          border = "rounded",
        },
      },

      autoformat = false,
    },
    setup = {
      lua_ls = function(_, opts)
        require("lazyvim.util").on_attach(function(client, buffer)
          if client.name == "lua_ls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
