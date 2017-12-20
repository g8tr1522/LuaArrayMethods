return function (self, ...)
	local t = self:gettable()
	
	return table.insert(t, ...)
end
