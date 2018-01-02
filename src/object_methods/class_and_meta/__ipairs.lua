return function (lam_obj)
	local t = lam_obj:gettable()
	local i = 0
	
	local iter = function ()
		i = i+1
		local v = t[i]
		if v then return i,v end
	end
	
	return iter, i
end