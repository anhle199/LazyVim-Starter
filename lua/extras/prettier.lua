return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettier",
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local prettier = require("null-ls").builtins.formatting.prettier.with({ prefer_local = true })
      table.insert(opts.sources, prettier)
    end,
  },
}
