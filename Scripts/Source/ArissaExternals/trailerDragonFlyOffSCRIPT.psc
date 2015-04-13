scriptname trailerDragonFlyOffSCRIPT extends objectReference
{support script for gameplay trailer, send dragon flying off on cue}

objectReference property perch auto
objectReference property dragon auto
armor property skinDragonTundra auto

EVENT onLoad()
	registerForUpdate(0.1)
endEVENT
	
EVENT onUpdate()
	if is3dloaded() == TRUE
; 		debug.trace("Okay, fire off the script")
		unRegisterForUpdate()
		if perch.isEnabled() == FALSE
			perch.enable()
		endif
		if dragon.isEnabled() == FALSE
			dragon.enable()
			(dragon as actor).additem(skinDragonTundra, 1)
			(dragon as actor).equipItem(skinDragonTundra, TRUE)
		else
			(dragon as actor).setActorValue("variable07", 0)
			dragon.moveTo(perch)
		endif
		(dragon as actor).evaluatePackage()
		utility.wait(19)
; 		debug.trace("dragon should start flying NOW")
		(dragon as actor).setActorValue("variable07", 1)
		(dragon as actor).evaluatePackage()
	endif
endEVENT
