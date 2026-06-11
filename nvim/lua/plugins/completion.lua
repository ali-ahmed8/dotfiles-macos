return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        
        -- NEW: Scroll the documentation/arguments popup window
        ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Move down 4 lines
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Move up 4 lines

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
      }),
    })

    -- Keep your existing TextChangedI autocommand below this line...
    vim.api.nvim_create_autocmd("TextChangedI", {
      pattern = "*.m",
      callback = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.api.nvim_win_get_cursor(0)[2]
        if col > 0 then
          local char = line:sub(col, col)
          if char == "(" or char == "," then
            vim.lsp.buf.signature_help()
          end
        end
      end,
    })
  end,
}
