---@type ChadrcConfig
local M = {}

M.ui = { theme = "bearded-arc" }

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- Search the internet
vim.api.nvim_create_user_command("Search", function(opts)
  io.popen("firefox --new-tab https://duckduckgo.com/?q=" .. table.concat(opts.fargs, "+"))
end, { nargs = "*" })

-- Tla syntax checker
vim.api.nvim_create_user_command("TlaCheckSyntax", function()
  if vim.fn.expand "%:e" == "tla" then
    require("nvterm.terminal").send(
      "$JAVA_HOME/bin/java -cp ~/Documents/coding/toolbox/tla2tools.jar tla2sany.SANY " .. vim.fn.expand "%:p",
      "vertical"
    )
  else
    print "not a tla file"
  end
end, {})

-- Tla model checker
vim.api.nvim_create_user_command("TlaCheckModel", function()
  if vim.fn.expand "%:e" == "tla" then
    require("nvterm.terminal").send(
      "$JAVA_HOME/bin/java -cp ~/Documents/coding/toolbox/tla2tools.jar tlc2.TLC -config "
        .. vim.fn.expand "%:p:r"
        .. ".cfg "
        .. vim.fn.expand "%:p:r"
        .. ".tla",
      "vertical"
    )
  else
    print "not a tla file"
  end
end, {})

-- Tla pluscal translator
vim.api.nvim_create_user_command("TlaPLuscalTranslate", function()
  if vim.fn.expand "%:e" == "tla" then
    assert(
      io.popen("$JAVA_HOME/bin/java -cp ~/Documents/coding/toolbox/tla2tools.jar pcal.trans " .. vim.fn.expand "%:p")
    )
    os.execute "sleep 0.5"
    vim.cmd "e!"
  else
    print "not a tla file"
  end
end, {})

-- Run tlapm
vim.api.nvim_create_user_command("Tlaps", function()
  if vim.fn.expand "%:e" == "tla" then
    require("nvterm.terminal").send("tlapm " .. vim.fn.expand "%:p", "vertical")
  else
    print "not a tla file"
  end
end, {})
return M
