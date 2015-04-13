Scriptname E3demoJumpAheadScript extends ObjectReference  
{this trigger fades out and moves the player to a new location.  Intended for demo purposes.}

imageSpaceModifier property E3DemoFadeToBlack auto
{Tweak this iMod to mess with the timing of fades.}

objectReference property goal auto
{where are we moving the player to?}

int property stageToSet auto
{Optional: set a stage in the E3demo quest when hit.}

quest property e3demo auto
{used for setting stages, if called for}

float property fLoadDelay = 3.0 auto
{Should line up with iMod. Time to wait from fade start to actual move/load}

bool bActive = FALSE

EVENT onTriggerEnter(objectReference actronaut)
	if bActive == FALSE
		transition()
	endif
endEVENT

EVENT onTriggerLeave(objectReference actronaut)
	if bActive == FALSE
		transition()
	endif
endEVENT

FUNCTION transition()
	bActive = TRUE
	E3DemoFadeToBlack.apply()
	utility.wait(fLoadDelay)
	if stageToSet != -1
		e3Demo.setStage(stageToSet)
	endif
	game.getPlayer().moveTo(goal)
endFUNCTION

