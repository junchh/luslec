return {
	{
		"rose-pine/neovim",
		priority = 1000,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("rose-pine").setup({
				variant = "moon",
			})
			vim.cmd.colorscheme("rose-pine")
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2b2842", fg = "NONE" })
		end,
	},
}
