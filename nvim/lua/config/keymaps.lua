local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>x", ":x<CR>")

map("n", "<leader>r", ":w<CR>:!g++ % -o %< && ./%<<CR>")

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>")

map("t", "<Esc>", [[<C-\><C-n>]])

-- Show diagnostic error/warning in a floating window
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

-- Paste the original copied value
map("x", "<leader>p", '"_dP')

-- Hitting Escape inside any floating popup safely closes it and returns to Insert Mode
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local win_config = vim.api.nvim_win_get_config(0)
    if win_config.relative and win_config.relative ~= "" then
      vim.keymap.set('n', '<Esc>', function()
        vim.cmd('close')        -- 1. Close the popup window FIRST
        vim.cmd('wincmd p')     -- 2. Jump back to your file
      end, { buffer = true, silent = true })
    end
  end,
})
