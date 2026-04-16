return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			terminal = { enabled = true },
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("snacks").picker.files()
				end,
				desc = "Find Files",
			},

			{
				"<leader>fe",
				function()
					require("snacks").picker.explorer()
				end,
				desc = "File Explorer",
			},

			{
				"<leader>fc",
				function()
					require("snacks").picker.colorschemes()
				end,
				desc = "Find Colorschemes",
			},

			{
				"<leader>fx",
				function()
					require("snacks").picker.diagnostics()
				end,
				desc = "Find Diagnostics",
			},

			{
				"<C-/>",
				mode = { "n", "t" },
				function()
					require("snacks").terminal()
				end,
				desc = "Terminal",
			},
		},
	},
}
