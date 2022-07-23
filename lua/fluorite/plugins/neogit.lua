local colors = require("fluorite.utils").colors
local Group = require("fluorite.utils").Group

---------------------------------------------------------------------------------
--                                   neogit                                    --
---------------------------------------------------------------------------------
Group.new("NeogitBranch", colors.green, nil, nil)
Group.new("NeogitRemote", colors.dark_pink, nil, nil)
Group.new("NeogitHunkHeader", colors.light_blue, nil, nil)
Group.new("NeogitHunkHeaderHighlight", colors.blue, nil, nil)
Group.new("NeogitDiffContextHighlight", colors.white, colors.fluorite_bg, nil)
Group.new("NeogitDiffDeleteHighlight", colors.white, colors.red:dark():dark():dark(), nil)
Group.new("NeogitDiffAddHighlight", colors.white, colors.green:dark():dark():dark(), nil)
Group.new("NeogitDiffDelete", colors.white, colors.red:dark():dark():dark(), nil)
Group.new("NeogitDiffAdd", colors.white, colors.green:dark():dark():dark(), nil)
Group.new("NeogitDiffDeleteRegion", colors.white, colors.red:dark():dark():dark(), nil)
Group.new("NeogitDiffAddRegion", colors.white, colors.green:dark():dark():dark(), nil)
