-- submodule which holds any methods that override vanilla metamethods

override = {}
_root = _mainroot..'src/methods/override'


override.__len = function (lam_object)
	local t = lam_object:gettable()
	return #t
end


return override
