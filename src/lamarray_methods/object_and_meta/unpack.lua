
local local_unpack = unpack or table.unpack 

function lam_unpack (self)
	local t = self:gettable()
	return local_unpack(t)
end

return lam_unpack
