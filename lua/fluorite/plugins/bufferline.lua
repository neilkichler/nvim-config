local colors = require("fluorite.utils").colors
local styles = require("fluorite.utils").styles
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                                 bufferline                                  --
---------------------------------------------------------------------------------
Group.new("BufferLineFill", colors.light_grey, colors.cursor_line, nil)
Group.new("BufferLineBackground", colors.dark_blue, nil, styles.italic)
Group.new("BufferLineBufferVisible", colors.dark_blue, nil, nil)
Group.new("BufferLineBufferSelected", colors.yellow, nil, nil)
Group.new("BufferLineTab", colors.white, nil, nil)
Group.new("BufferLineTabSelected", colors.yellow, colors.cursor_hover, styles.bold)
Group.new("BufferLineTabClose", colors.red, nil, nil)
Group.new("BufferLineIndicatorSelected", colors.dark_pink, nil, nil)
-- separator
Group.new("BufferLineSeparator", colors.grey, nil, nil)
Group.new("BufferLineSeparatorVisible", colors.grey, nil, nil)
Group.new("BufferLineSeparatorSelected", colors.dark_pink, nil, nil)
-- close buttons
Group.new("BufferLineCloseButton", colors.light_pink, nil, styles.bold)
Group.new("BufferLineCloseButtonVisible", colors.red, nil, styles.bold)
Group.new("BufferLineCloseButtonSelected", colors.red, nil, styles.bold)
