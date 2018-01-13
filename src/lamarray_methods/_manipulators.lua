-- manipulators submodule which holds all the array manipulators for lam objects
--
-- We use the functions in 'src/basic_methods/basic_manipulators.lua' to create these functions
-- The 'manipulators' (for lam objects) are created automatically
--		by making them 'wrappers' for the already loaded basic versions.
-- This is done by using a loop to make the lam class methods (that are just
--		wrapper functions from each basic function).
-- Some methods must be overridden because they would not operate as expected 
--		when made by these loops. These are kept in the folder 'overridden_manip'.
--

manipulators = {}

--=============================================================================
-- require basic manipulators here:

--insert_methods_from_submodule(manipulators, 'src/methods/basic_methods/manipulators')
--local basic_methods = require(_mainroot.."src/methods/_basic_methods")
local basic_manipulators = require(_mainroot.."src/basic_methods/basic_manipulators")



--=============================================================================
-- add lamarray manipulators here


-- destructive functions which modify the lamarray in place
local d_keys = {
	"remove",
	"insert",
}

for _,key in ipairs(d_keys) do
	manipulators[key] = function (self, ...)
		local basic_func = basic_manipulators[key]
		self.table = basic_func(self.table, ...)
	end
end


-- non-destructive functions which only return new lamarrays (and the original is preserved)			
local nd_keys = {
	"copy",
	"split",
}

for _,key in ipairs(nd_keys) do
	manipulators[key] = function (self, ...)
		local basic_func = basic_manipulators[key]
		local t = self:gettable()
		local rvs = {}		-- returned values
		
		rvs={ basic_func(t, ...) }
		
		for i=1,#rvs do 
			rvs[i] = lam.new( rvs[i] )
			rvs[i].lamtype = key
		end
		
		return unpack(rvs)
	end
end



--basic_manipulators = nil
return manipulators
