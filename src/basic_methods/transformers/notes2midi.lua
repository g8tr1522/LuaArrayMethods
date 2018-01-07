
local reverse_keys 		= {}
reverse_keys['C'] 		= 0
reverse_keys['C#'] 		= 1
reverse_keys['D-'] 		= 1
reverse_keys['D'] 		= 2
reverse_keys['D#'] 		= 3
reverse_keys['E-'] 		= 3
reverse_keys['E'] 		= 4
reverse_keys['F-'] 		= 4
reverse_keys['E#'] 		= 5
reverse_keys['F'] 		= 5
reverse_keys['F#'] 		= 6
reverse_keys['G-'] 		= 6
reverse_keys['G'] 		= 7
reverse_keys['G#'] 		= 8
reverse_keys['A-'] 		= 8
reverse_keys['A'] 		= 9
reverse_keys['A#'] 		= 10
reverse_keys['B-'] 		= 10
reverse_keys['B'] 		= 11
reverse_keys['C-'] 		= 11
reverse_keys['B#'] 		= 0


local strsub = string.sub

local main_algo = function (str)
	local rn = -1		-- return number/note
	local midi_octave = 0
	
	str = string.upper(str)
	local last_char = tonumber(strsub(str, #str))
	
	if type(last_char)=="number" then
		midi_octave = last_char*12
		rn = reverse_keys[ strsub(str, 1, #str-1) ]
	else
		rn = reverse_keys[str]
	end
	
	return rn + midi_octave
end

-------------------------------------------------------------------------------

local notes2midi = function (t, transpose, octave)
--handle input args (except t)
	octave = octave or 0
	octave = math.floor(octave)
	
	if type(transpose)=="number" then
		transpose = math.floor(transpose)
	elseif type(transpose)=="string" then
		transpose = main_algo(transpose, 0,0)
	else
		transpose = 0
	end
	
--declare locals
	local ro = {}		--return object
	
--do main algorithm depending on whether t is a string or a table of strings
	if type(t)=="string" then
		ro = main_algo(t)	+ transpose + octave*12	
	elseif type(t)=="table" then
		for i=1,#t do
			ro[i] = main_algo(t[i]) + transpose + octave*12	
		end
	end
	
	return ro
end


return notes2midi