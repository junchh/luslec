return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({
			n_lines = 500,
		})
		require("mini.files").setup({
			mappings = {
				close = "<leader>w",
			},
			options = {
				use_as_default_explorer = false,
			},
		})
		local files = require("mini.files")
		vim.keymap.set("n", "<leader>w", function()
			files.open(vim.api.nvim_buf_get_name(0))
		end, { desc = "Open Mini Files" })
		vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { bg = "#544e7e", fg = "NONE" })
	end,
}
