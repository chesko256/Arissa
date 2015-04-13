scriptname cityLightsControlSCRIPT extends objectReference
{Dummy object to turn city lights off when the player enters the actual city.}

objectReference property LODlights auto
{Point this as the reference in Tamriel of the LOD lights object}
worldSpace property cityWorldspace auto
{what city are we handling? When the player is in this worldspace, disable LOD lights}

EVENT onCellAttach()
	; cell has attached, so disable the lights!
	LODlights.disable()
endEVENT

EVENT onCellDetach()
	; cell detached, so the lights can be put on again
	LODlights.enable()
endEVENT

;EVENT onLoad()
	; 3D of dummy has been loaded, so the player must have entered the city.
;	while self.is3DLoaded() == FALSE
;		utility.wait(1.0)
;	endWhile
	; turn off the LOD lights object while player is in the city 
	;(Because this object is placed in a spot where its 3D is always loaded if any part of the city is)
	; register for an  update to periodically check to see if the player has exited the main city worldspace.
;	registerForSingleUpdate(10)
;endEVENT

;EVENT onUpdate()
;	if (game.getPlayer()).getWorldSpace() != cityWorldspace
	;	LODlights.enable()
	;else
		; player must still be within the city worldspace, so leave lights on and check again soon.
;		registerForSingleUpdate(10)
	;endif
;endEVENT
