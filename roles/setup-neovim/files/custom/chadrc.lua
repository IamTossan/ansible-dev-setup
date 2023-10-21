---@type ChadrcConfig
local M = {}

M.ui = { theme = 'tokyonight' }

M.plugins = "custom.plugins"

vim.api.nvim_create_user_command(
  "Search",
  function(opts)
    io.popen("firefox --new-tab https://duckduckgo.com/?q=" .. table.concat(opts.fargs, "+"))
  end,
  { nargs = "*" }
)

return M
