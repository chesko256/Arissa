Scriptname highGateRuinsObjectPuzzle extends ObjectReference  
{A puzzle where the player has 4 objects and needs to place them in the appropriate bowls.}

import debug

;which container are we?  we'll set this on the reference
bool property containerA auto
bool property containerB auto
bool property containerC auto
bool property containerD auto

;the flames or whatever we'll use to show it's correct, these will be set on the base
objectReference property flameA auto
objectReference property flameB auto
objectReference property flameC auto
objectReference property flameD auto

;the objects to be placed in the triggers, these will also be set on the base script
objectReference property objectA auto
objectReference property objectB auto
objectReference property objectC auto
objectReference property objectD auto

;the door and the marker to open it
objectReference property puzzDoor auto
objectReference property marker auto

EVENT onTrigger(objectReference ref)
	
	;IF(ref != game.getPlayer())
		messageBox ( "Object Has Entered!" )
	;ENDIF
	
	;which object entered and is it in the proper trigger?
	IF(containerA && ref == objectA)
		flameA.enable()
			
	ELSEIF(ref == objectB)
		IF(containerB)
			flameB.enable()
		ELSE
		ENDIF
		
	ELSEIF(containerC && ref == objectC)
		flameC.enable()
			
	ELSEIF(containerD && ref == objectD)
		flameD.enable()
		
	ENDIF
	
	;if we're all done and all of the flames are on, open the door
	IF(flameA.isDisabled() == FALSE && flameB.isDisabled() == FALSE && flameC.isDisabled() == FALSE  && flameD.isDisabled() == FALSE )
		puzzDoor.activate(marker)
	ENDIF

ENDEVENT
