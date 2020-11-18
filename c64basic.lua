
require "c64.sprites"
local Vice = require('c64/vice')
Vice.load("E:/Millfork/plat/bin/game.bin.lbl")


while true do
	
	showHWSprites()

	Vice.text(0,32,"vic_border")

--	emu.yield()
	emu.frameadvance();
end