local Vice = {}
Vice.labels = {}
function Vice.load(filename)
	-- make a dictionary of vice labels
	file = io.open(filename, "r")
	io.input(file)
	for line in io.lines() do
		if line~=nil then
			local result = bizstring.split(line," ");
			local address = tonumber(result[2], 16)
			local name = bizstring.replace(result[3],".","");
			Vice.labels[name] = address
		end
	end
	io.close()
end

function Vice.Address(key)
	if Vice.labels[key]==nil then print(key .. " Not Found") return 0 end
	return Vice.labels[key]
end

--	return value from string

function Vice.U16(key)
	local addr = Vice.Address(key)
	return memory.read_u16_le(addr)
end

function Vice.U8(key)
	local addr = Vice.Address(key)
	return memory.readbyte(addr)
end

-- gui text for label
function Vice.text(x,y,key)
	s = key .. " $" .. bizstring.hex(Vice.Address(key)) .. ":" .. bizstring.hex(Vice.U8(key))
	gui.text(x,y,s)
end

return Vice
