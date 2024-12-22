-- 颜色方案(主题)
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- 配置 LazyVim 以加载gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- 切换主题
      colorscheme = "tokyonight-storm",
      --  colorscheme = "gruvbox",
    },
  }
}
