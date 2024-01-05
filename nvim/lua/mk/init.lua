--require("mk.set")
vim.g.mapleader = " "
require("mk.lazy")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.g.netrw_banner = 0
vim.g.netwr_winsize = 25
vim.wo.number = true



vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "<leader>lK", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>lv", function() vim.lsp.buf.open_float() end, opts)
		vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

	end
})
