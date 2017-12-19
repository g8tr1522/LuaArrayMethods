print()

t = {}
mt = {}
setmetatable(t, mt)
other = {}


t.__call = function (...)
	print("=== Calling t.call")
	print("  = args passed were        :", ...)
end


mt.__index = function (t,k)
	print("--- Calling mt.__index")
	print("  - table without index was :", tostring(t) )
	print("  - tried to access key      ", tostring(k) )
	--print("  - `...` returned           ", ...)
	--print("  - length of `{...}`        ", #{...})
	print()
	
	return other[k]
end
-- mt.__index = {}
-- mt.__index.__call = function (t,k,...)
	-- print("--- Calling mt.__index")
	-- print("  - table without index was :", tostring(t) )
	-- print("  - tried to access key      ", tostring(k) )
	-- print("  - `...` returned           ", ...)
	-- print()
-- end

mt.__call = function (t, ...)
	print("=== Calling mt.__call")
	print("  = t is                    :", tostring(t))
	print("  = args passed             :", ...)
	print()
end


other.a = function(...)
	print("--- Calling other.a")
	print("  - `...` returned           ", ...)
	print("  - length of `{...}`        ", #{...})
end




print("~~~ Location of t             : "..tostring(t))
print("  ~ t.__call                  : "..tostring(t.__call))
print()
print("~~~ Location of mt            : "..tostring(mt))
print("  ~ mt.__index                : "..tostring(mt.__index))
print("  ~ mt.__call                 : "..tostring(mt.__call))
print("  ~ mt.__index.__call         : "..tostring(mt.__index))
print()
print("~~~ Location of other         : "..tostring(t))
print("  ~ other.a                   : "..tostring(other.a))
print()

print()