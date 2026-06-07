vim.api.nvim_create_user_command("MatlabMode", function()
  -- Save the starting tabpage
  local current_tab = vim.api.nvim_get_current_tabpage()

  -- Create the new tab and capture its ID
  vim.cmd("tabnew")
  local other_tab = vim.api.nvim_get_current_tabpage()

  -- Start MATLAB in the new tab's buffer
  vim.cmd("terminal matlab -nodesktop -nosplash")
  local mat_buf = vim.api.nvim_get_current_buf()

  -- Store the job ID globally
  vim.g.matlab_job_id = vim.b.terminal_job_id

  -- Switch back to your original tabpage immediately
  vim.api.nvim_set_current_tabpage(current_tab)

  vim.notify("⏳MATLAB Loading...", vim.log.levels.INFO)

  -- Create a background timer to poll the buffer text (works flawlessly on hidden tabs)
  local timer = vim.uv.new_timer()

  timer:start(200, 500, vim.schedule_wrap(function()
    -- Ensure the buffer still exists to prevent crashes if closed early
    if not vim.api.nvim_buf_is_valid(mat_buf) then
      timer:stop()
      timer:close()
      return
    end

    -- Get all lines currently in the terminal buffer
    local lines = vim.api.nvim_buf_get_lines(mat_buf, 0, -1, false)

    for _, line in ipairs(lines) do
      -- Check if MATLAB's prompt ">> " has appeared anywhere in the stream
      if line:match(">> ") then
        vim.notify("🚀 MATLAB ready", vim.log.levels.INFO)

        timer:stop()
        timer:close()
        break
      end
    end
  end))
end, {})


