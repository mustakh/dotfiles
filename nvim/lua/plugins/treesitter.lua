return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = function(_, opts)
			opts = opts or {}

			local function add_unique(dst, items)
				local seen = {}
				for _, v in ipairs(dst) do
					seen[v] = true
				end
				for _, v in ipairs(items) do
					if not seen[v] then
						table.insert(dst, v)
						seen[v] = true
					end
				end
			end

			-- Важно: включаем tree-sitter highlight, чтобы JS/TS подсвечивались одинаковым механизмом.
			-- Это убирает различия из-за vim regex syntax (`javaScript*` vs `typescript*` группы).
			opts.highlight = opts.highlight or {}
			opts.highlight.enable = true
			opts.highlight.additional_vim_regex_highlighting = false

			-- Сворачивание блоков по синтаксису (div, объекты, функции и т.д.)
			opts.fold = opts.fold or {}
			opts.fold.enable = true

			opts.ensure_installed = opts.ensure_installed or {}
			add_unique(opts.ensure_installed, {
				"astro",
				"cmake",
				"cpp",
				"css",
				"fish",
				"gitignore",
				"go",
				"graphql",
				"http",
				"java",
				"javascript",
				"php",
				"rust",
				"scss",
				"sql",
				"svelte",
				"tsx",
				"typescript",
			})

			-- matchup = {
			-- 	enable = true,
			-- },

			-- https://github.com/nvim-treesitter/playground#query-linter
			opts.query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			}

			opts.playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = true, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			}

			return opts
		end,
		config = function(_, opts)
			local TS = require("nvim-treesitter")
			TS.setup(opts)

			-- MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
