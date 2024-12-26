-- Correctly expanding the home directory symbol '~' to the actual path
local home = os.getenv("HOME")
if home then
    package.path = package.path .. ";" .. home .. "/.config/nvim/?.lua"
    package.path = package.path .. ";" .. home .. "/.config/nvim/?/init.lua"
else
    print("Error: HOME environment variable not set.")
end

-- basic vim setup
require("vp.settings")
require("vp.remaps")

-- plguin manager setup
require("vp.plugins.setup")

-- plguins
require("vp.plugins.catppuccin")
require("vp.plugins.treesitter")
require("vp.plugins.neodev")
require("vp.plugins.lsp")
require("vp.plugins.autocomplete")
require("vp.plugins.autoclose")
