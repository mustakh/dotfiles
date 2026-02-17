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
					vscBack = "#000000", -- основной фон
				},

				group_overrides = {
					Normal = { bg = "#000000" },
					NormalNC = { bg = "#000000" },
					SignColumn = { bg = "#000000" },
					EndOfBuffer = { bg = "#000000" },
				},
			})

			vim.cmd.colorscheme("vscode")
		end,
	},
}
