vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set(
      "n",
      "<leader>c",
      ':w<CR>:below 10split | terminal g++ -std=c++17 -Wall -o "%:p:r" "%:p" && "%:p:r"<CR>',
      { buffer = true }
    )
  end,
})
