return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader><Space>", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "/", function()
				builtin.live_grep({ search_dirs = { vim.fn.expand("%:p") } })
			end, { desc = "[/] Fuzzily search in current buffer" })
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					component_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "filetype" },
					lualine_y = {},
					lualine_z = { "location" },
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					style_preset = 2,
					close_icon = " ",
					buffer_close_icon = " ",
					indicator = {
						style = "icon",
					},
					offsets = {
						{
							filetype = "NvimTree",
							highlight = "Directory",
							text_align = "left",
						},
						{
							filetype = "snacks_layout_box",
						},
					},
				},
			})

			local builtin = require("bufferline")
			vim.keymap.set("n", "<S-h>", function()
				builtin.cycle(-1)
			end, { desc = "Prev Buffer" })
			vim.keymap.set("n", "<S-l>", function()
				builtin.cycle(1)
			end, { desc = "Next Buffer" })
		end,
	},
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {},
		keys = {
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bo",
				function()
					Snacks.bufdelete.other()
				end,
				desc = "Delete Buffer",
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}
