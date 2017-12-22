
local loc_unpack = unpack or table.unpack  -- Renoise API does not have table.unpack

function lam_unpack (self)
	local t = self:gettable()
	return loc_unpack(t)
end

return lam_unpack
