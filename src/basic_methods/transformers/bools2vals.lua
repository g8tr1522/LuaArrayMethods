-- converts "true" or "false" to 1 and 0 respectively


local bool2val = function(val)
	if val==true then
		return 1
	elseif val==false then
		return 0
	else
		return val
	end
end


return function (t)
	if type(t)=="boolean" then
		return bool2val(t)
	elseif type(t)=="table" then
		--local rt = lam.copy_vla(t)
		local rt = {}
		for i=1,#t do
			rt[i] = bool2val(t[i])
		end
		return rt
	end
end
