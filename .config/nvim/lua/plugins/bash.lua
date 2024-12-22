if true then return {} end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        "shfmt",
        "shellcheck",
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local function add(lang)
        if type(opts.ensure_installed) == "table" then
          table.insert(opts.ensure_installed, lang)
        end
      end
  
      vim.filetype.add({
        extension = { rasi = "rasi" },
        pattern = {
          [".*/waybar/config"] = "jsonc",
          [".*/mako/config"] = "dosini",
          [".*/kitty/*.conf"] = "bash",
          [".*/hypr/.*%.conf"] = "hyprlang",
        },
      })
  
      add("git_config")
  
      if have("hypr") then
        add("hyprlang")
      end
  
      if have("fish") then
        add("fish")
      end
  
      if have("rofi") or have("wofi") then
        add("rasi")
      end
    end,
  },

}
