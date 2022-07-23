local colors = require("fluorite.utils").colors
local styles = require("fluorite.utils").styles
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                                trouble.nvim                                 --
---------------------------------------------------------------------------------
Group.new("TroubleCount", colors.yellow, nil, nil)
Group.new("TroubleError", colors.red, colors.red, nil)
Group.new("TroubleNormal", colors.light_grey, nil, nil)
Group.new("TroubleTextInformation", colors.light_blue, nil, nil)
Group.new("TroubleSignWarning", colors.light_yellow, nil, nil)
Group.new("TroubleLocation", colors.blue, nil, nil)
Group.new("TroubleWarning", colors.light_yellow, nil, nil)
Group.new("TroublePreview", colors.fluorite_bg, colors.red, nil)
Group.new("TroubleTextError", colors.white, nil, nil)
Group.new("TroubleSignInformation", colors.light_blue, nil, nil)
Group.new("TroubleIndent", colors.light_grey, nil, nil)
Group.new("TroubleSource", colors.darkest_grey, nil, nil)
Group.new("TroubleSignHint", colors.green, nil, nil)
Group.new("TroubleSignOther", colors.light_grey, nil, nil)
Group.new("TroubleFoldIcon", colors.grey, nil, nil)
Group.new("TroubleTextWarning", colors.light_yellow, nil, nil)
Group.new("TroubleCode", colors.light_grey, nil, nil)
Group.new("TroubleInformation", colors.green, nil, nil)
Group.new("TroubleSignError", colors.red, nil, nil)
Group.new("TroubleFile", colors.blue, nil, nil)
Group.new("TroubleHint", colors.green, nil, nil)
Group.new("TroubleTextHint", colors.green, nil, nil)
Group.new("TroubleText", colors.light_grey, nil, nil)
