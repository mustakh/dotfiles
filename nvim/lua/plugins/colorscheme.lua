return {
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		name = "vscode-theme",
		config = function()
			require("vscode").setup({
				style = "dark",
				transparent = false,
				italic_comments = false,
				disable_nvimtree_bg = true,

				color_overrides = {
					vscBack = "#131314", -- основной фон
				},

				group_overrides = {
					Normal = { bg = "#131314" },
					NormalNC = { bg = "#131314" },
					SignColumn = { bg = "#131314" },
					EndOfBuffer = { bg = "#131314" },
				},
			})

			vim.cmd.colorscheme("vscode")
		end,
	},
}
