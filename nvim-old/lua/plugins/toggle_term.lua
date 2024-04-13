return {
	-- amongst your other plugins
	-- { "akinsho/toggleterm.nvim", version = "*", config = true },
	-- or
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 10,
			direction = "horizontal",
			open_mapping = [[<c-\>]],
			float_opts = {
				border = "curved",
				zindex = 1,
				title_pos = "left",
			},
			--[[ things you want to change go here]]
		},
	},
}
