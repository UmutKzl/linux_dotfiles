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
  -- {
    --   "nvim-treesitter/nvim-treesitter",
    --   lazy = false,
    --   build = ":TSUpdate",
    --   config = function()
      --     require("nvim-treesitter").install { "lua" } --ADD LANGUAGE HERE
      --   end,
      -- },
      {
        "romus204/tree-sitter-manager.nvim",
        dependencies = {}, -- tree-sitter CLI must be installed system-wide
        config = function()
          require("tree-sitter-manager").setup({
            -- Default Options
            -- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
            -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
            -- auto_install = false, -- if enabled, install missing parsers when editing a new file
            -- highlight = true, -- treesitter highlighting is enabled by default
            -- languages = {}, -- override or add new parser sources
            -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
            -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
          })
        end
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
