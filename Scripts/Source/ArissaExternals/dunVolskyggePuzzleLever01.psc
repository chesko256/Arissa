scriptName dunVolskyggePuzzleLever01 extends ObjectReference
{
-This script is used on the lever used in the Volskygge puzzle
-This script initializes the lever to be on the wall/floor or already pulled.
-The 'Pulled' marker indicates the direction the lever will go when activated.
-By default the lever is one the floor, and not yet pulled.
}


import debug
import utility

ObjectReference property puzzleEncounter auto
{The encounter to be enabled when the portcullis is opened}

bool property puzzleEncounterEnabled auto hidden
{False=encounter not enabled, True=encounter is already enabled}

bool property isOnWall auto
{
True = Lever is on wall
False = Lever is on floor (default)
}

bool property isAlreadyPulled auto
{
True = Lever is already pulled
False = Lever is not yet pulled (default)
}


Event OnInit()
	;trace(self + ".OnInit() - wall = " + isOnWall + " pulled = " + isAlreadyPulled)
	if (isAlreadyPulled == false)
		if (isOnWall == false)
														;do nothing because the default position is on the floor and unpulled
			;trace("Lever starts UP on the FLOOR")
			gotoState("upPosition")
		else											;lever is on wall
			Wait(1)									;animation doesn't seem to load immediately - so a delay to help ensure it exists when we want to play
			playAnimation("PullPosition")		;start the lever on the wall, and unpulled
			;trace("Lever starts UP on the WALL")
			gotoState("upPosition")
		endif
	else												;lever has already been pulled
		if (isOnWall == false)
			Wait(1)									;animation doesn't seem to load immediately - so a delay to help ensure it exists when we want to play
			playAnimation("PulledPosition")	;start the lever on the floor and pulled
			;trace("Lever starts DOWN on the FLOOR")
			gotoState("DownPosition")
		else											;lever has been pulled
			Wait(1)									;animation doesn't seem to load immediately - so a delay to help ensure it exists when we want to play
			playAnimation("PushPosition")		;start the lever on the wall, and pulled
			;trace("Lever starts DOWN on the WALL")
			gotoState("DownPosition")
		endif
	endif
	
endEvent
	

STATE upPosition	; This is the state I'm in when up and at rest
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		;trace("Switch Animating Down")
		if (isOnWall == true)		;if the lever is on the wall animate full pushed to pulled	 									
			playAnimationandWait("FullPull","FullPulledDown")	
		else						;if the lever is on the floor animate from mid to pulled							
			playAnimationandWait("PullDown","Pulled")
		endif
		wait(0.3)
		if (puzzleEncounterEnabled == False)
			puzzleEncounter.enable()
			puzzleEncounterEnabled=True
		endif
		;trace("Switch Down")
		gotoState("downPosition")
	endEVENT
endState

STATE downPosition	; This is the state I'm in when i'm down and at rest
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		;trace("Switch Animating Up")
		if (isOnWall == true)	;if the lever is on the wall animate from pulled to pushed
			playAnimationandWait("FullPush","FullPushedUp")
		else					;if the lever is on the floor animate from pulled to mid
			playAnimationandWait("PullUp","UnPulled")
		endif
		wait(0.3)
		;trace("Switch Up")
		gotoState("upPosition")
	endEVENT
endState

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;trace ("Switch Busy")
		endEVENT
endSTATE
