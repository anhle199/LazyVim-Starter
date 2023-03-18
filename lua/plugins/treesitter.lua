return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "windwp/nvim-ts-autotag" },
  opts = function(_, opts)
    -- disable treesitter for the large files
    opts.highlight.disable = function(_, buf)
      local max_filesize = 1024 * 1024 -- 1MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end

    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "cpp", "css", "java", "rust", "dockerfile", "sql" })
    end

    opts.autotag = { enable = true }
  end,
}
