local colors = require("fluorite.utils").colors
local styles = require("fluorite.utils").styles
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                               nvim-treesitter                               --
---------------------------------------------------------------------------------
Group.new("TSError", colors.red, nil, nil)
Group.new("TSPunctDelimiter", colors.white, nil, nil)
Group.new("TSPunctBracket", colors.white, nil, nil)
Group.new("TSPunctSpecial", colors.white, nil, nil)
-- Constant
Group.new("TSConstant", colors.orange, nil, nil)
Group.new("TSConstBuiltin", colors.orange, nil, nil)
Group.new("TSConstMacro", colors.blue, nil, nil)
Group.new("TSStringRegex", colors.green, nil, nil)
Group.new("TSStringEscape", colors.orange, nil, nil)
Group.new("TSStringSpecial", colors.green, nil, nil)
Group.new("TSCharacter", colors.orange, nil, nil)
Group.new("TSNumber", colors.orange, nil, nil)
Group.new("TSBoolean", colors.orange, nil, nil)
Group.new("TSFloat", colors.orange, nil, nil)
Group.new("TSAnnotation", colors.white, nil, nil)
Group.new("TSAttribute", colors.white, nil, nil)
Group.new("TSNamespace", colors.darkest_green, nil, nil)
-- Functions
Group.new("TSFuncBuiltin", colors.white, nil, nil)
Group.new("TSFunction", colors.white, nil, nil)
Group.new("TSFuncMacro", colors.white, nil, nil)
Group.new("TSParameter", colors.white, nil, nil)
Group.new("TSParameterReference", colors.white, nil, nil)
Group.new("TSMethod", colors.white, nil, nil)
Group.new("TSField", colors.white, nil, nil)
Group.new("TSProperty", colors.white, nil, nil)
Group.new("TSConstructor", colors.white, nil, nil)
-- Keywords
Group.new("TSConditional", colors.red, nil, nil)
Group.new("TSRepeat", colors.red, nil, nil)
Group.new("TSLabel", colors.green, nil, nil)
Group.new("TSKeyword", colors.white, nil, nil)
Group.new("TSKeywordReturn", colors.red, nil, nil)
Group.new("TSKeywordFunction", colors.darkest_green, nil, nil)
Group.new("TSKeywordOperator", colors.red, nil, nil)
Group.new("TSOperator", colors.white, nil, nil)
Group.new("TSException", colors.red, nil, nil)
Group.new("TSType", colors.darkest_green, nil, nil)
Group.new("TSTypeBuiltin", colors.red, nil, nil)
Group.new("TSStructure", colors.light_blue, nil, nil)
Group.new("TSInclude", colors.darkest_green, nil, nil)
-- Variable
Group.new("TSVariable", colors.white, nil, nil)
Group.new("TSVariableBuiltin", colors.white, nil, nil)
-- Text
Group.new("TSText", colors.white, nil, nil)
Group.new("TSStrong", colors.white, nil, styles.bold)
Group.new("TSEmphasis", colors.white, nil, styles.italic)
Group.new("TSUnderline", colors.white, nil, styles.underline)
Group.new("TSTitle", colors.yellow, nil, styles.bold)
Group.new("TSLiteral", colors.light_green, nil, nil)
Group.new("TSURI", colors.light_blue, nil, styles.underline)
-- Tags
Group.new("TSTag", colors.yellow, nil, nil)
Group.new("TSTagDelimiter", colors.dirty_blue, nil, nil)

