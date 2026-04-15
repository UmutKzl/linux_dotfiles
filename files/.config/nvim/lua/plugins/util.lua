return {
	{
		"nvim-telescope/telescope.nvim", version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{"<leader><leader>", function() require("telescope.builtin").find_files() end, desc = "Find files"},
			{"<leader>cs", function() require("telescope.builtin").colorscheme() end, desc = "Colorschemes"},
			{"<leader>xx", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics"},
			{"<leader>bu", function() require("telescope.builtin").buffers() end, desc = "Buffers"},
		}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	}
}
