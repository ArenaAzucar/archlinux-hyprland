return {
  {
    "arsham/fzfmania.nvim",
    dependencies = {
      "arshlib.nvim",
      "fzf.vim",
      "nvim.lua",
      "plenary.nvim",
      -- uncomment if you want a better ui.
      -- {
      --   "ibhagwan/fzf-lua",
      --   dependencies = { "kyazdani42/nvim-web-devicons" },
      -- },
    },
    config = {
      -- frontend = "fzf-lua", -- uncomment if you want a better ui.
    },
    event = { "VeryLazy" },
  }
}
