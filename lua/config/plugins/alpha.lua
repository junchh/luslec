return {
	"goolord/alpha-nvim",
	config = function()
		local theme = require("config.themes.default")
		require("alpha").setup(theme.config)
	end,
}
