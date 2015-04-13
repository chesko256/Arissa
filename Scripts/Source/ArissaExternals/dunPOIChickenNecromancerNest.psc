Scriptname dunPOIChickenNecromancerNest extends ObjectReference  

spell property dunReanimateSelf auto
objectReference property chicken01 auto
objectReference property chicken02 auto
objectReference property chicken03 auto
objectReference property chicken04 auto
faction property necromancerFaction auto

bool property done auto HIDDEN

EVENT onActivate(objectReference akTriggerRef)
	if done == FALSE
		done = TRUE
		dunReanimateSelf.cast(chicken01,chicken01)
		dunReanimateSelf.cast(chicken02,chicken02)
		dunReanimateSelf.cast(chicken03,chicken03)
		dunReanimateSelf.cast(chicken04,chicken04)
		(chicken01 as actor).addToFaction(NecromancerFaction)
		(chicken02 as actor).addToFaction(NecromancerFaction)
		(chicken03 as actor).addToFaction(NecromancerFaction)
		(chicken04 as actor).addToFaction(NecromancerFaction)
	endif
endEVENT

