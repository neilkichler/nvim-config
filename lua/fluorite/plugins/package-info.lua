local colors = require("fluorite.utils").colors
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                              package-info.nvim                              --
---------------------------------------------------------------------------------
Group.new("PackageInfoOutdatedVersion", colors.dark_pink:light():light(), nil, nil)
Group.new("PackageInfoUptoDateVersion", colors.light_grey:dark():dark(), nil, nil)
