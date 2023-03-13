return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    -- formatting
    local nls = require("null-ls")
    table.insert(opts.sources, nls.builtins.formatting.prettierd)

    -- typescript
    local tsCodeActions = require("typescript.extensions.null-ls.code-actions")
    table.insert(opts.sources, tsCodeActions)
  end,
}
