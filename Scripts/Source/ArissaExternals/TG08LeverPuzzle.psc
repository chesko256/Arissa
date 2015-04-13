scriptName TG08LeverPuzzle extends objectReference
{Dual lever pull puzzle script}

objectReference property TorchOff auto
objectReference property TorchOn auto
objectReference property Gears auto
objectReference property Gears2 auto
objectReference property pairedLever auto
objectReference property poleLinker auto
objectReference property Glow auto
bool property leverActivated = false auto hidden
bool property isLoaded auto hidden
float property PulledTimerDuration = 30.0 auto hidden
{how long to stay active}
float property CurrentPulledTimer auto hidden
bool property parentLever = false auto
{Marks if this is the parent lever for controlling the spears}
bool property puzzleSolved = false auto hidden

objectReference property TG08BPuzzleGateEnableParent auto
{this is disabled shortly after the puzzle is finished to make sure things are cell load/reset safe}

;NORMAL LEVER STUFF
bool property isInPullPosition = True Auto

EVENT OnCellLoad()
	if TG08BPuzzleGateEnableParent.isEnabled()
		SetDefaultState()
	else
		playAnimation("FullPush")
		spinUp()
		goToState("Complete")
	endif
endEVENT

Event OnReset()
	SetDefaultState()
EndEvent

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Auto STATE pulledPosition
	EVENT onActivate (objectReference triggerRef)
		gotoState ("busy")
		isInPullPosition = False
		playAnimationandWait("FullPush","FullPushedUp")
		gotoState("pushedPosition")
	endEVENT
endState

STATE pushedPosition
	; EVENT onActivate (objectReference triggerRef)
		; gotoState ("busy")
		; isInPullPosition = True
		; playAnimationandWait("FullPull","FullPulledDown")
		; gotoState("pulledPosition")
	; endEVENT
	
	Event onBeginState()
		spinUp()
		leverActivated = true
		CurrentPulledTimer = (utility.getCurrentRealTime() + PulledTimerDuration)
		
		while (utility.getCurrentRealTime() < CurrentPulledTimer) && !puzzleSolved
			if parentLever && (pairedLever as TG08LeverPuzzle).leverActivated
				(pairedLever as TG08LeverPuzzle).puzzleSolved = true
				puzzleSolved = true
			endif
		utility.wait(0.2)
		endWhile
		
		if !puzzleSolved
			leverActivated = False
			gotoState ("busy")
			isInPullPosition = True
			playAnimationandWait("FullPull","FullPulledDown")
			gotoState("pulledPosition")
			spinDown()
		else
			goToState("Complete")
		endif
	endEvent
endState

STATE busy
	; This is the state when I'm busy animating
	EVENT onActivate (objectReference triggerRef)
		;do nothing
	endEVENT
endSTATE

State Complete
	Event onBeginState()
		if parentLever
			poleLinker.activate(self)
			utility.wait(4.0)
			TG08BPuzzleGateEnableParent.disable()
		endif
	endEvent
	
	EVENT onActivate (objectReference triggerRef)
	endEVENT
endState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetDefaultState()
	if (isInPullPosition)
		playAnimation("FullPull")
		gotoState("pulledPosition")
	Else
		playAnimation("FullPush")
		gotoState("pushedPosition")
	EndIf
EndFunction

Function spinUp()		;Turn on gear
	gears.activate(self)
	gears2.activate(self)
	Glow.enable(abFadein = True)
	torchOn.enable()
	torchOff.disable(abfadeout = true)
endFunction


Function spinDown()	;Turn off gear
	gears.activate(self)
	gears2.activate(self)
	Glow.disable(abFadeOut = True)
	torchOff.enable()
	torchOn.disable(abfadeout = true)
endFunction
