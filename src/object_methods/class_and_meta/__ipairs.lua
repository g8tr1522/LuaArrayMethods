return function (lam_obj)
	local t = lam_obj:gettable()
	local i = 0
	
	local iter = function (t)
		i = i+1
		local v = t[i]