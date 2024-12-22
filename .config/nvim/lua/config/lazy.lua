local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- 引导 lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)


require("lazy").setup({
  spec = {
    -- 添加 LazyVim 并且导入它的其他插件
    { "LazyVim/LazyVim",                                 import = "lazyvim.plugins" },
    -- 在此处导入任何 extra 模块
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- 导入/覆盖你的插件
    { import = "plugins" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.formatting.black" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.ui.alpha" },
    -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "lazyvim.plugins.extras.util.dot" },
  },
  defaults = {
    -- 默认情况下，只有 LazyVim 插件会被懒加载。 您的自定义插件将在启动过程中加载。
    -- 如果你知道你在做什么，你可以将它设置为 `true` 来默认懒加载你所有的自定义插件。
    lazy = false,
    -- 建议现在先远离 version=false，因为许多支持版本的插件已经
    -- 过时了，这可能会破坏您的NeoVim安装。
    version = false, -- 永远使用最新的 git commit 版本
    -- version = "*", -- 尝试安装最新稳定版本插件来支持 semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- 自动检查插件更新
  performance = {
    rtp = {
      -- 禁用一些 rtp 插件
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
