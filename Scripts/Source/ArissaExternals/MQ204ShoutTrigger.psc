Scriptname MQ204ShoutTrigger extends MQShoutTrigger  

; override parent function to disable linked ref
Function setFogState(bool bTurnOnFog)
	if !bTurnOnFog
		; update quest when triggered
		MQ204.SetStage(90)
		; for now, just permanently disabled linked collision box
		if GetLinkedRef()
; 			debug.trace(self + " disabling linked ref " + GetLinkedRef())
			GetLinkedRef().Disable()
		endif
	endif
	parent.setFogState(bTurnOnFog)
endFunction

Quest Property MQ204  Auto  
