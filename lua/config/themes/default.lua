local header = {
	type = "text",
	val = {
		[[ _                 _______  _        _______  _______ ]],
		[[( \      |\     /|(  ____ \( \      (  ____ \(  ____ \]],
		[[| (      | )   ( || (    \/| (      | (    \/| (    \/]],
		[[| |      | |   | || (_____ | |      | (__    | |      ]],
		[[| |      | |   | |(_____  )| |      |  __)   | |      ]],
		[[| |      | |   | |      ) || |      | (      | |      ]],
		[[| (____/\| (___) |/\____) || (____/\| (____/\| (____/\]],
		[[(_______/(_______)\_______)(_______/(_______/(_______/]],
		[[                                                      ]],
	},
	opts = {
		position = "center",
		hl = "Type",
		-- wrap = "overflow";
	},
}
local description = {
	type = "text",
	val = {
		[[ A Highly Opinionated Neovim Configuration ]],
	},
	opts = {
		position = "center",
		hl = "Type",
		-- wrap = "overflow";
	},
}

local version = {
	type = "text",
	val = "v" .. vim.version():__tostring(),
	opts = {
		position = "center",
		hl = "Type",
		-- wrap = "overflow";
	},
}

local config = {
	layout = {
		{ type = "padding", val = 20 },
		header,
		{ type = "padding", val = 2 },
		version,
		{ type = "padding", val = 1 },
		description,
	},
	opts = {
		margin = 5,
	},
}

return {
	config = config,
}
