if not mods["FUMO"] then
    return
end

local m_lib = require("lib.manipulation")

m_lib.overwrite({ "simple-entity-with-owner", "cirnoitem" }, { max_health = 1000000 })
