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

vim.api.nvim_create_user_command(
  "SwitchBuffer",
  function(opts)
    local bufs = vim.t.bufs
    if not bufs or tonumber(opts.fargs[1]) > #bufs then
      return
    end
    vim.cmd("b" .. bufs[tonumber(opts.fargs[1])])
  end,
  { nargs = 1 }
)

return M
