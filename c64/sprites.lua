
function showHWSprites()
	-- grab hardware for enable and msb 
	local msb = memory.readbyte(0xd010)
	local ena = memory.readbyte(0xd015)
	local x = 0
	for i = 0, 8, 2 do
		--	mask just us 
		if bit.band(ena,bit.lshift(1,x))~=0 then 
			eX=memory.readbyte(0xd000 + i )-8			--	tweak this 
			eY=memory.readbyte(0xd001 + i )-36
			--	check msb bit
			if bit.band(msb,bit.lshift(1,x))~=0 then 
				eX=eX+256
			end
			--	draw the rectangle
			gui.drawRectangle(eX, eY, 24, 21, 0xffffffff)

			x=x+1
		end
	end
end




