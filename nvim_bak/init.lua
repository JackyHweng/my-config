require("jacky.base")
require("jacky.keymaps")
require("jacky.colorscheme")
require("jacky.plugins")

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require("jacky.macos")
end

if is_win then
  require("jacky.windows")
end
