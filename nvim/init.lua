require('jacky.base')
require("jacky.themes")
require('jacky.highlights')
require('jacky.keymaps')
require('jacky.plugins')
require('jacky.toggleterm')
require('jacky.lualine')

local has = vim.fn.has
local is_mac = has "maxunix"
local is_win = has "win32"

if is_mac then
  require('jacky.macos')
end

if is_win then
  require('jacky.windows')
end
