local nnoremap = require("ak.core.keymap_utils").nnoremap
local inoremap = require("ak.core.keymap_utils").inoremap


-- set leader key to space
vim.g.mapleader = " "

-- use jk to exit insert mode
inoremap("jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
nnoremap("<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })


-- window management
nnoremap("<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
nnoremap("<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
nnoremap("<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
nnoremap("<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

nnoremap("<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
nnoremap("<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
nnoremap("<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
nnoremap("<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
nnoremap("<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

