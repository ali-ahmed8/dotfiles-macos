return {
  'saghen/blink.cmp',
  lazy = false, -- Load immediately on startup
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',

  opts = {
    -- 'default' sets up Ctrl+n / Ctrl+p to navigate suggestions, Enter to accept
    keymap = { preset = 'default' },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    -- Tells blink to look for the LSP (MATLAB) suggestions
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
}
