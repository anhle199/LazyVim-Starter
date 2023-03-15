return {
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin", enabled = false },

  {
    "Mofiqul/vscode.nvim",
    config = function()
      return require("vscode").setup({
        transparent = false,
        italic_comments = true,
        disable_nvimtree_bg = true,
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
