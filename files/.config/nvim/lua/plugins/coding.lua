return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" }, --ADD LANGUAGE HERE
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install { "lua" } --ADD LANGUAGE HERE
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "1.*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "super-tab" },

      appearance = {
        nerd_font_variant = "normal" -- normal or mono
      },

      completion = { documentation = { auto_show = false } },

      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  }
}
