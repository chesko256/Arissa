scriptName MiddenEnchantedSkull extends objectReference
{just a fun visual toy}

import utility

float property maxRotate auto
float property maxMove auto
effectShader property IllusionFearFXS auto
bool Up
float bob	; amplitude

EVENT onLoad()
	if maxRotate == 0
		maxRotate = 359.0
	endif

	IllusionFearFXS.play(self)

	if is3Dloaded() == TRUE
		registerForSingleUpdate(1.0)
	endif
	
endEVENT

EVENT onUpdate()
; 	;debug.trace("JOEL DEBUG: Enchanted Skull Updating")
; 	;debug.trace(self)
	if UP == TRUE
		bob = maxmove
		UP = FALSE
	else
		bob = -1*maxmove
		UP = TRUE
	endif
	translateTo(self.x, self.y, (self.z+bob), 0, 0,randomFloat(1,maxRotate), 0.15) 

	if is3Dloaded() == TRUE
		registerForSingleUpdate(3.0)
	endif

endEVENT
