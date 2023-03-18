return {
  -- LazyVim has installed "python"
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "python" })
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "pyright", "black", "isort", "pylint" })
        -- missing "djlint"
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
                diagnosticMode = "openFilesOnly",
                diagnosticSeverityOverrides = {
                  reportImportCycles = "error",
                  reportUnusedImport = "warning",
                  reportUnusedClass = "warning",
                  reportUnusedFunction = "warning",
                  reportUnusedVariable = "warning",
                  reportDuplicateImport = "error",
                  reportUnnecessaryCast = "warning",
                  reportUnnecessaryComparison = "warning",
                  reportUnnecessaryContains = "warning",
                },
              },
            },
          },
        },
      },
      setup = {
        pyright = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "pyright" then
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end

            if client.name == "pylint" then
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          end)
        end,
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls_builtin = require("null-ls").builtins

      vim.list_extend(opts.sources, {
        nls_builtin.formatting.black.with({ extra_args = { "--fast", "--line-length=120" } }),
        nls_builtin.formatting.isort.with({ extra_args = { "--style=black" } }),
        nls_builtin.diagnostics.pylint,
      })
    end,
  },
}
