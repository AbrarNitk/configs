-- Fully Featured & enhanced replacement for copilot.vim complete with API for
-- interacting with GitHub Copilot
-- https://github.com/zbirenbaum/copilot.lua

return {
	{
		"zbirenbaum/copilot.lua",
		enabled = false,
		event = { "BufEnter" },
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = false,
				},
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		enabled = false,
		event = { "BufEnter" },
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
