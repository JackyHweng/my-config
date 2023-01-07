require('jacky.base')
require("jacky.themes")
require("jacky.icons")
require('jacky.keymaps')
require('jacky.highlights')
require('jacky.plugins')
require("jacky.conf.aerial")
require("jacky.conf.which-key")

local has = vim.fn.has
local is_mac = has "maxunix"
local is_win = has "win32"

if is_mac then
  require('jacky.macos')
end

if is_win then
  require('jacky.windows')
end
