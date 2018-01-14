-- rounds numbers to the nearest integer

local floor = math.floor

local round = function(val)
	if type(val)=="number" then
		if val%1 < 0.5 then
			return floor(val)
		else
			return floor(val+1)
		end
	else
		return val
	end
end


return function (t)
	if type(t)=="number" then
		return round(t)
	elseif type(t)=="table" then
		--local rt = lam.copy_vla(t)
		local rt = {}
		for i=1,#t do
			rt[i] = round(t[i])
		end
		return rt
	end
end