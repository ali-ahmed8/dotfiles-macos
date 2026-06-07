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


vim.api.nvim_create_autocmd("FileType", {
  pattern = "matlab",
  callback = function()
    vim.keymap.set("n", "<leader>c", function()
      -- 1. Save the current file
      vim.cmd("w")

      if not vim.g.matlab_job_id then
        print("MATLAB not ready. Open MATLAB tab first.")
        return
      end

      -- 2. Run the code via the channel channel
      local file = vim.fn.expand("%:p")
      vim.fn.chansend(
        vim.g.matlab_job_id,
        "run('" .. file .. "')\n"
      )

      -- 3. Force the MATLAB terminal window to scroll to the bottom in the background
      -- We look for the window that matches your MATLAB terminal buffer
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)

        -- Check if this window is displaying the MATLAB terminal
        if buf_name:match("matlab") or vim.bo[buf].buftype == "terminal" then
          -- Get the total number of lines in that terminal buffer
          local line_count = vim.api.nvim_buf_line_count(buf)
          -- Safely force the window's cursor to the very last line
          vim.api.nvim_win_set_cursor(win, {line_count, 0})
        end
      end

    end, { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    local job_id = vim.b.terminal_job_id
    local buf = vim.api.nvim_get_current_buf()

    vim.g.matlab_ready = false

    vim.defer_fn(function()
      local name = vim.api.nvim_buf_get_name(buf)

      if name:match("matlab") then
        vim.g.matlab_job_id = job_id
        vim.g.matlab_ready = true
      end
    end, 100)
  end,
})

