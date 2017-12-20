return function (self, ...)
	local t = self:gettable()
	
	return table.remove(t, ...)
end
