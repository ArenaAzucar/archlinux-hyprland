return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme 可以是一个像`catppuccin` 这样的字符串或者一个将加载颜色方案
      ---@type string|fun()
      colorscheme = function()
        require("tokyonight").load()
      end,
      -- 加载默认设置
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = true, -- lazyvim.config.keymaps
        options = true, -- lazyvim.config.options
      },
      -- 其他插件使用的图标
      icons = {
        diagnostics = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },
        git = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        kinds = {
          Array = " ",
          Boolean = " ",
          Class = " ",
          Color = " ",
          Constant = " ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Folder = " ",
          Function = " ",
          Interface = " ",
          Key = " ",
          Keyword = " ",
          Method = " ",
          Module = " ",
          Namespace = " ",
          Null = "ﳠ ",
          Number = " ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          Reference = " ",
          Snippet = " ",
          String = " ",
          Struct = " ",
          Text = " ",
          TypeParameter = " ",
          Unit = " ",
          Value = " ",
          Variable = " ",
        },
      },
    }
  }
}
