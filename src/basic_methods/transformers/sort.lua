-- just a shell for the vanilla table.sort function
--

local vsort = table.sort

return function (t, sf)
	local rt = lam.copy_vla(t)
	
	vsort(rt, sf)
	
	return rt
end