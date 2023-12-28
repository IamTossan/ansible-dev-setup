local M = {}

M.abc = {
  n = {
    ["<leader>k"] = { ":Telescope keymaps <CR>", "Telescope Keymaps" },
    ["<leader>ds"] = {
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      "[D]ocument [S]ymbols",
    },
    ["<leader>ws"] = {
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end,
      "[W]orkspace [S]ymbols",
    },
  },
}

return M
