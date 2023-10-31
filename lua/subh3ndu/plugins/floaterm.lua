return {
	"voldikss/vim-floaterm",
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>ft", "<cmd>FloatermNew<CR>", {})
		keymap.set("n", "<leader>fn", "<cmd>FloatermNext<CR>", {})
		keymap.set("n", "<leader>fp", "<cmd>FloatermPrev<CR>", {})
	end,
}
