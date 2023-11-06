---@type ChadrcConfig
local M = {}

M.ui = { theme = 'tokyonight' }

M.plugins = "custom.plugins"

-- Search the internet
vim.api.nvim_create_user_command(
  "Search",
  function(opts)
    io.popen("firefox --new-tab https://duckduckgo.com/?q=" .. table.concat(opts.fargs, "+"))
  end,
  { nargs = "*" }
)

-- Switch tabs
-- vim.api.nvim_create_user_command(
--   "SwitchBuffer",
--   function(opts)
--     local bufs = vim.t.bufs
--     if not bufs or tonumber(opts.fargs[1]) > #bufs then
--       return
--     end
--     vim.cmd("b" .. bufs[tonumber(opts.fargs[1])])
--   end,
--   { nargs = 1 }
-- )

-- Tla syntax checker
vim.api.nvim_create_user_command(
  "TlaCheckSyntax",
  function()
    if vim.fn.expand("%:e") == "tla" then
      require("nvterm.terminal")
        .send(
          "$JAVA_HOME/bin/java -cp ~/.local/share/tla2tools/tla2tools.jar tla2sany.SANY "
          .. vim.fn.expand("%:p"),
          "vertical"
        )
    else
      print("not a tla file")
    end
  end,
  {}
)
-- Tla model checker
vim.api.nvim_create_user_command(
  "TlaCheckModel",
  function()
    if vim.fn.expand("%:e") == "tla" then
      require("nvterm.terminal")
        .send(
          "$JAVA_HOME/bin/java -cp ~/.local/share/tla2tools/tla2tools.jar tlc2.TLC -config "
          .. vim.fn.expand('%:p:r') .. ".cfg "
          .. vim.fn.expand("%:p:r") .. ".tla",
          "vertical"
        )
    else
      print("not a tla file")
    end
  end,
  {}
)
-- Tla pluscal translator
vim.api.nvim_create_user_command(
  "TlaPLuscalTranslate",
  function()
    if vim.fn.expand("%:e") == "tla" then
      assert(io.popen(
        "$JAVA_HOME/bin/java -cp ~/.local/share/tla2tools/tla2tools.jar pcal.trans "
        .. vim.fn.expand("%:p")
      ))
      os.execute("sleep 0.5")
      vim.cmd("e!")
    else
      print("not a tla file")
    end
  end,
  {}
)
-- Run tlapm
vim.api.nvim_create_user_command(
  "Tlaps",
  function()
    if vim.fn.expand("%:e") == "tla" then
      require("nvterm.terminal")
        .send(
          "tlapm " .. vim.fn.expand("%:p"),
          "vertical"
        )
    else
      print("not a tla file")
    end
  end,
  {}
)
return M
