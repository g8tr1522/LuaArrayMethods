-- converts 1 and 0 to "true" and "false" respectively
--
--
--


local val2bool = function(val)
	if val==1 then
		return true
	elseif val==0 then
		return false
	else
		return val
	end
end


return function (t)	
	if type(t)=="number" then
		return val2bool(t)
	elseif type(t)=="table" then
		--local rt = lam.copy_vla(t)
		local rt = {}
		for i=1,#t do
			rt[i] = val2bool(t[i])
		end
		return rt
	end
end
