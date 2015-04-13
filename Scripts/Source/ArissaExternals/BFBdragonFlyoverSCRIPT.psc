scriptname BFBdragonFlyoverSCRIPT extends objectReference

objectReference property BFBdragon auto
objectReference property initialPosition auto
objectReference property dragonsEnabled auto
quest property BFBquest auto

bool doEnterOnce
bool doLeaveOnce

EVENT OnTriggerEnter(objectReference actronaut)
	if doEnterOnce == FALSE && actronaut == game.getPlayer() && BFBquest.isStageDone(90) == TRUE && dragonsEnabled.isEnabled()
		doEnterOnce = TRUE
		BFBdragon.enable()
		BFBdragon.moveTo(initialPosition)
	endif
endEVENT

EVENT OnTriggerLeave(objectReference actronaut)
	if doLeaveOnce == FALSE && actronaut == game.getPlayer() && BFBdragon.isEnabled() == TRUE
		doLeaveOnce = TRUE
		BFBquest.setStage(91)
		(BFBdragon as actor).setActorValue("aggression", 1)
		(BFBdragon as actor).startCombat(game.getPlayer())
	endif
endEVENT
