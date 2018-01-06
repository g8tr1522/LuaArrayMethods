--

basic_methods = {}
local _root = _mainroot.."src/basic_methods/"


local function insert_methods_from_submodule (submodule_name)
	local subm = require(_root..submodule_name)
	for k,v in pairs(subm) do
		basic_methods[k] = v
	end
	subm = nil
end



-- transformers
insert_methods_from_submodule('basic_transformers')

-- manipulators
insert_methods_from_submodule('basic_manipulators')

-- selectors
insert_methods_from_submodule('basic_selectors')




return basic_methods
