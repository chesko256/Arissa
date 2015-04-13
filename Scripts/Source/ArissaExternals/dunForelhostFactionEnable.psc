scriptName dunForelhostFactionEnable extends objectReference
{This script enables/disables markers depending on which CW faction the player is part of}

bool property valmirIsImperial = false auto
objectReference property ImpEnableMarker auto
objectReference property SonsEnableMarker auto

cwScript property CWS auto


event OnTriggerEnter(objectReference triggerRef)
; 	debug.Trace(self + " has been entered by " + triggerRef)
	if triggerRef == game.getPlayer()
		if CWS.playerAllegiance == CWS.iImperials	;player is part of imperial faction
			if !valmirIsImperial
				valmirIsImperial = TRUE
				ImpEnableMarker.enable()			;enable imperial version of Valmir
				SonsEnableMarker.disable()			;disable sons version of Valmir
			endif
		else										;player is part of sons faction
			if valmirIsImperial
				valmirIsImperial = FALSE
				ImpEnableMarker.disable()			;disable imperial version of Valmir
				SonsEnableMarker.enable()			;enable sons version of Valmir
			endif
		endif
	Else
; 		debug.Trace(self + ": error - " + triggerRef + " != player")
	endif

endEvent
