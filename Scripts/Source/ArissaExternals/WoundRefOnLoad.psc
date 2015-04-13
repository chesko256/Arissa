Scriptname WoundRefOnLoad extends actor  
{This will hurt the ref it is attached to when it loads}

float property goalHealth = 10.0 auto
{How much HP to leave on the ref. DEFAULT: 10% (bleedout on most actors)}

EVENT onLoad()
	float HPtoDmg = ((self.getBaseAV("health"))*((100-goalHealth)/100))
	; check to make sure we leave at least 1 HP
	if HPtoDmg >= (self.getBaseAV("health"))
		HPtoDmg = HPtoDmg - 1
	endif
	self.damageAV("health",HPtoDmg)
endEVENT
