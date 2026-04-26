local augroup = vim.api.nvim_create_augroup("webdev", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = {
		"json",
		"yaml",
		"yml",
		"html",
		"css",
		"scss",
		"javascript",
		"typescript",
		"typescriptreact",
		"javascriptreact",
		"vue",
	},
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end,
})
