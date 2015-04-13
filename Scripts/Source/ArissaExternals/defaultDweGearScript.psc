scriptName defaultDweGearScript extends objectReference
;

;string property gearAnim = "loop" auto

;event onLoad()
	;playAnimation("StartOpen")
;endEvent

bool property useOffAnim = false auto
{whether to play the off anim when activated a second time
	default = false}
bool property off = true auto hidden

event onLoad()
	if off
		playAnimation ("startOff")
	else
		playAnimation ("startLooping")
	endif
endEvent


auto state off
	event onActivate(objectReference akActivator)
; 	debug.trace (self + "the gear has been turned on")
		playAnimation ("fixLoop")
		goToState("On")
	endEvent
endState

state on
	event onActivate(objectReference akActivator)
; 		debug.trace (self + "the gear has been turned off")
			if useOffAnim
				playAnimation ("Off")
			else
				playAnimation ("fixLoop")
			endif
			goToState("Off")
	endEvent
endState
