return {
	-- tools
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
			})
		end,
	},

	-- lsp servers + keymaps
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			-- global LSP opts
			opts.inlay_hints = opts.inlay_hints or {}
			opts.inlay_hints.enabled = false

			---@type lspconfig.options
			opts.servers = opts.servers or {}
			-- Keymaps (LazyVim): задаём через servers['*'].keys (а не через deprecated keymaps.get()).
			opts.servers["*"] = vim.tbl_deep_extend("force", opts.servers["*"] or {}, {
				keys = {
					{
						"gd",
						function()
							-- DO NOT RESUSE WINDOW
							require("telescope.builtin").lsp_definitions({ reuse_win = false })
						end,
						desc = "Goto Definition",
						has = "definition",
					},
				},
			})
			opts.servers.cssls = opts.servers.cssls or {}
			opts.servers.html = opts.servers.html or {}

			opts.servers.tailwindcss = vim.tbl_deep_extend("force", opts.servers.tailwindcss or {}, {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
			})

			opts.servers.tsserver = vim.tbl_deep_extend("force", opts.servers.tsserver or {}, {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
				single_file_support = false,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			})

			opts.servers.yamlls = vim.tbl_deep_extend("force", opts.servers.yamlls or {}, {
				settings = {
					yaml = {
						keyOrdering = false,
					},
				},
			})

			opts.servers.lua_ls = vim.tbl_deep_extend("force", opts.servers.lua_ls or {}, {
				-- enabled = false,
				single_file_support = true,
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							workspaceWord = true,
							callSnippet = "Both",
						},
						misc = {
							parameters = {
								-- "--log-level=trace",
							},
						},
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
						doc = {
							privateName = { "^_" },
						},
						type = {
							castNumberToInteger = true,
						},
						diagnostics = {
							disable = { "incomplete-signature-doc", "trailing-space" },
							-- enable = false,
							groupSeverity = {
								strong = "Warning",
								strict = "Warning",
							},
							groupFileStatus = {
								["ambiguity"] = "Opened",
								["await"] = "Opened",
								["codestyle"] = "None",
								["duplicate"] = "Opened",
								["global"] = "Opened",
								["luadoc"] = "Opened",
								["redefined"] = "Opened",
								["strict"] = "Opened",
								["strong"] = "Opened",
								["type-check"] = "Opened",
								["unbalanced"] = "Opened",
								["unused"] = "Opened",
							},
							unusedLocalExclude = { "_*" },
						},
						format = {
							enable = false,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
								continuation_indent_size = "2",
							},
						},
					},
				},
			})

			-- Частая причина отличий подсветки в TS/TSX (vs JS) — LSP semantic tokens от tsserver,
			-- которые перекрывают colorscheme/syntax. На всякий случай отключаем их для TS/TSX.
			opts.setup = opts.setup or {}
			local prev_tsserver_setup = opts.setup.tsserver
			opts.setup.tsserver = function(server, server_opts)
				if prev_tsserver_setup then
					pcall(prev_tsserver_setup, server, server_opts)
				end

				local old_on_attach = server_opts.on_attach
				server_opts.on_attach = function(client, bufnr)
					local ft = vim.bo[bufnr].filetype
					if ft == "typescript" or ft == "typescriptreact" then
						client.server_capabilities.semanticTokensProvider = nil
						if vim.lsp.semantic_tokens and vim.lsp.semantic_tokens.stop then
							pcall(vim.lsp.semantic_tokens.stop, bufnr, client.id)
						end
					end

					if old_on_attach then
						old_on_attach(client, bufnr)
					end
				end
			end
		end,
	},
}
