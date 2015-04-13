scriptName dunYngolLightsOutSCRIPT extends objectReference
{Simple script for atmosphere event in hall of stories @ Yngol BArrow}

objectReference property Fire01 auto
objectReference property Fire02 auto
objectReference property Fire03 auto
objectReference property Fire04 auto
objectReference property Fire05 auto
objectReference property Fire06 auto

objectReference property light01 auto
objectReference property light02 auto
objectReference property light03 auto

;activator property embersSmolder auto
;miscObject property embersOff auto

FUNCTION Dim(objectReference fire, objectReference assocLight = NONE)
	float scale = fire.getScale()
	fire.disable(TRUE) ; fade out initial fire art
	;objectReference smolder = fire.placeAtMe(embersSmolder)
	;smolder.setScale(scale)
	if assocLight  != NONE
		assocLight.disable()
	endif
endFUNCTION

EVENT onTriggerEnter(objectReference actronaut)
	if actronaut == game.getPlayer()
		dim(fire01)
		utility.wait(0.05)
		dim(fire02, light01)
		utility.wait(0.05)
		dim(fire03)
		utility.wait(0.05)
		dim(fire04, light02)
		dim(fire05)
		utility.wait(0.03)
		dim(fire06, light03)
	endif
endEVENT

