return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettier")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local formatting = require("null-ls").builtins.formatting
      table.insert(opts.sources, formatting.prettier.with({ prefer_local = true }))
    end,
  },
}
