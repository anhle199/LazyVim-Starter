return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-buffer", enabled = false },
  },
  opts = function(_, opts)
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local icons = {
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
    }

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Mappings
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<C-n>"] = cmp.config.disable,
      ["<C-p>"] = cmp.config.disable,
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })

    -- Sources
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
    })

    -- Formatting
    opts.formatting = {
      format = function(_, item)
        if icons[item.kind] then
          item.kind = string.format("%s %s", icons[item.kind], item.kind)
        end
        return item
      end,
    }
  end,
}
