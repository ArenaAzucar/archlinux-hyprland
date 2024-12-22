if true then return {} end

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "black")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "black" },
        ["go"] = { "black" },
        ["lua"] = { "black" },
        ["bash"] = { "black" },
      },
    },
  }

}
