return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    -- 1. Ensure Mason is initialized so the binary path exists
    require("mason").setup()

    -- 2. Dynamically pull Mason's internal path to the matlab binary
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/matlab-language-server"

    -- 3. Exact syntax from the README for servers not on the $PATH
    vim.lsp.config('matlab_ls', {
      cmd = { mason_bin, "--stdio" },
      settings = {
        MATLAB = {
          installPath = "/Applications/MATLAB_R2026a.app",
          telemetry = false,
        }
      }
    })

    -- 4. Enable the config so it activates natively for MATLAB filetypes
    vim.lsp.enable('matlab_ls')
  end
}
