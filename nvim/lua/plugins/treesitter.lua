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
			local ok_legacy, legacy_configs = pcall(require, "nvim-treesitter.configs")
			if ok_legacy then
				legacy_configs.setup(opts)
			else
				-- Compatibility path for the rewritten nvim-treesitter (main branch).
				local ok_new, ts = pcall(require, "nvim-treesitter")
				if ok_new then
					ts.setup({})

					if type(opts.ensure_installed) == "table" and #opts.ensure_installed > 0 then
						pcall(ts.install, opts.ensure_installed)
					end

					local group = vim.api.nvim_create_augroup("NvimTreesitterCompat", { clear = true })

					if opts.highlight and opts.highlight.enable then
						vim.api.nvim_create_autocmd("FileType", {
							group = group,
							callback = function(args)
								pcall(vim.treesitter.start, args.buf)
							end,
						})
					end

					if opts.fold and opts.fold.enable then
						local function apply_fold_for_buf(bufnr)
							for _, win in ipairs(vim.fn.win_findbuf(bufnr)) do
								if vim.api.nvim_win_is_valid(win) then
									pcall(vim.api.nvim_set_option_value, "foldmethod", "expr", { win = win })
									pcall(vim.api.nvim_set_option_value, "foldexpr", "v:lua.vim.treesitter.foldexpr()", { win = win })
								end
							end
						end

						vim.api.nvim_create_autocmd("FileType", {
							group = group,
							callback = function(args)
								apply_fold_for_buf(args.buf)
							end,
						})

						vim.api.nvim_create_autocmd("BufWinEnter", {
							group = group,
							callback = function(args)
								apply_fold_for_buf(args.buf)
							end,
						})
					end
				else
					vim.notify("nvim-treesitter is not available", vim.log.levels.ERROR)
				end
			end

			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
