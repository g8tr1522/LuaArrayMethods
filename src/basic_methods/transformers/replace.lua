-- replaces `t[i]` with `object`
-- if `i` is a table, the replace each `t[i[j]]` with `object[i]`
--
--


local mini_replace = function (t, i, obj, len_t)
	if i<#t then
		t[i] = obj
	end
end


return function (t, i, obj)
	local rt = lam.copy_VLA(t)
	local len_rt = #rt
	
	if type(i)=="number" then
		mini_replace(rt, i, obj, len_rt)
	elseif type(i)=="table" then
		if type(obj)~="table" then
			for j=1,#i do
				mini_replace(rt, i[j], obj, len_rt)
			end
		else
			if #obj==#i then
				for j=1,#i do
					mini_replace(rt, i[j], obj[j], len_rt)
				end
			end
		end		
	end
	
	return rt
end
