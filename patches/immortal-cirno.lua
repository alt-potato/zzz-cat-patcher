if not mods["FUMO"] then
    return
end

local logl = require("lib.log")
local mlib = require("lib.manipulation")

logl.info("Granting Cirno immortality...")
mlib.overwrite({ "simple-entity-with-owner", "cirnoitem" }, { max_health = 1000000 })
