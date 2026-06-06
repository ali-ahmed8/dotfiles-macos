local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>x", ":x<CR>")

map("n", "<leader>r", ":w<CR>:!g++ % -o %< && ./%<<CR>")

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>")

map("t", "<Esc>", [[<C-\><C-n>]])
