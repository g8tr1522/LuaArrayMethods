--

basic = {}
_root = _mainroot.."src/methods/basic/"


local function insert_methods_from_submodule (submodule_name)
	local subm = require(_root..submodule_name)
	for k,v in pairs(subm) do
		basic[k] = v
	end
	subm = nil
end



-- manipulators
insert_methods_from_submodule('manip')

-- selectors (that don't rely on the `count` property)
--insert_methods_from_submodule('selectors')




return basic
