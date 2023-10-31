vim.g.mapleader = " " -- set leader to <Space>

local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "Netrw Explorer" })
keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit All" })
keymap.set("n", "<leader>aa", "ggVG", { desc = "For cp" })
keymap.set("n", "<leader>io", "<cmd>vs input.txt<CR><cmd>sp output.txt<CR>", { desc = "For cp" })
keymap.set("n", "<leader>ss", "<cmd>w<CR>", { desc = "For cp" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

----------------------------
-- Map Specific to filetype
----------------------------

-- For cpp files
vim.api.nvim_exec(
	[[
  autocmd FileType cpp nnoremap <buffer> <leader>gc <cmd>! g++ -std=c++17 -Wshadow -Wall -o %< % -O2 -Wno-unused-result<CR>
]],
	false
)
vim.api.nvim_exec(
	[[
  autocmd FileType cpp nnoremap <buffer> <leader>gb <cmd>! clang++ -std=c++17 -Wshadow -Wall -o %< % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG <CR>
]],
	false
)
vim.api.nvim_exec(
	[[
  autocmd FileType cpp nnoremap <buffer> <leader>rr <cmd>!./%< < input.txt > output.txt<CR>
]],
	false
)
