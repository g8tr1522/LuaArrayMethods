-- use chance submodule to shuffle array


return function (self)
	local t = self:gettable()
	
	return chance.helpers.shuffle(t)
end
