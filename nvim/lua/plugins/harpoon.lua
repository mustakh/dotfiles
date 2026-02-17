return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function(_, opts)
			require("harpoon"):setup(opts)
		end,
		-- Чтобы плагин лениво подгружался по хоткеям, держим маппинги тут, а не в config()
		-- stylua: ignore
		keys = {
			{ "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon: добавить файл" },
			{ "<leader>h", function() local h = require("harpoon"); h.ui:toggle_quick_menu(h:list()) end, desc = "Harpoon: меню" },

			{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon: файл 1" },
			{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon: файл 2" },
			{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon: файл 3" },
			{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon: файл 4" },
			{ "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Harpoon: файл 5" },
			{ "<leader>6", function() require("harpoon"):list():select(6) end, desc = "Harpoon: файл 6" },
			{ "<leader>7", function() require("harpoon"):list():select(7) end, desc = "Harpoon: файл 7" },
			{ "<leader>8", function() require("harpoon"):list():select(8) end, desc = "Harpoon: файл 8" },

			{ "<leader>hp", function() require("harpoon"):list():prev() end, desc = "Harpoon: предыдущий" },
			{ "<leader>hn", function() require("harpoon"):list():next() end, desc = "Harpoon: следующий" },
		},
	},
}
