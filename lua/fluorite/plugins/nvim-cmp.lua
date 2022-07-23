local colors = require("fluorite.utils").colors
local styles = require("fluorite.utils").styles
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                                  nvim-cmp                                   --
---------------------------------------------------------------------------------
Group.new("CmpItemAbbrDeprecated", colors.red, nil, nil)
Group.new("CmpItemAbbrMatch", colors.fluorite_bg, colors.grey, styles.bold)
Group.new("CmpItemKindClass", colors.dark_orange, nil, nil)
Group.new("CmpItemKindConstructor", colors.yellow, nil, nil)
Group.new("CmpItemKindField", colors.fluorite_bg, nil, nil)
Group.new("CmpItemKindFile", colors.light_grey, nil, nil)
Group.new("CmpItemKindFolder", colors.green, nil, nil)
Group.new("CmpItemKindFunction", colors.light_pink, nil, nil)
Group.new("CmpItemKindInterface", colors.dark_pink, nil, nil)
Group.new("CmpItemKindKeyword", colors.yellow, nil, nil)
Group.new("CmpItemKindMethod", colors.dark_orange, nil, nil)
Group.new("CmpItemKindModule", colors.dark_pink, nil, nil)
Group.new("CmpItemKindProperty", colors.light_blue, nil, nil)
Group.new("CmpItemKindSnippet", colors.light_grey, nil, nil)
Group.new("CmpItemKindText", colors.light_green, nil, nil)
Group.new("CmpItemKindUnit", colors.green, nil, nil)
Group.new("CmpItemKindVariable", colors.white, nil, nil)
Group.new("CmpItemKind", colors.light_pink, nil, nil)
Group.new("CmpItemAbbr", colors.fluorite_bg, colors.grey, nil)

vim.cmd("highlight link CmpItemKindOperator TSOperator")
vim.cmd("highlight link CmpItemKindReference TSParameterReference")
vim.cmd("highlight link CmpItemKindValue TSField")
vim.cmd("highlight link CmpItemKindEnum TSField")
vim.cmd("highlight link CmpItemKindColor cssColor")
vim.cmd("highlight link CmpItemKindEvent TSConstant")
vim.cmd("highlight link CmpItemKindEnumMember TSField")
vim.cmd("highlight link CmpItemKindConstant TSConstant")
vim.cmd("highlight link CmpItemKindStruct TSStructure")
vim.cmd("highlight link CmpItemKindTypeParameter TSParameter")
