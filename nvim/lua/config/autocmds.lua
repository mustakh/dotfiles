-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- TypeScript иногда выглядит "по-другому", потому что LSP semantic tokens и inlay hints
-- перекрашивают поверх colorscheme/treesitter. Для TS/TSX отключаем их на уровне LSP-attach.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local ft = vim.bo[bufnr].filetype
		if not vim.tbl_contains({ "typescript", "typescriptreact", "javascriptreact" }, ft) then
			return
		end

		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
			if vim.lsp.semantic_tokens and vim.lsp.semantic_tokens.stop then
				pcall(vim.lsp.semantic_tokens.stop, bufnr, client.id)
			end
		end

		-- Убрать фиолетовые "плашки" (inlay hints) для TS/TSX
		if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
			pcall(vim.lsp.inlay_hint.enable, false, { bufnr = bufnr })
		end
	end,
})
