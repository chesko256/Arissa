Scriptname bwcMuralSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY mural AUTO
EFFECTSHADER PROPERTY glow AUTO

BOOL PROPERTY glowTRIG AUTO
BOOL PROPERTY disableTRIG AUTO

BOOL doOnce

; // find out which trigger we are:
; // if we're the glow trigger start the glow
; // if we're the disable trigger disable the wall and the trigger
EVENT onTriggerEnter(OBJECTREFERENCE obj)
		
	IF(glowTRIG)
		IF(obj == game.getPlayer())
			glow.Play(mural)
			
		ENDIF
	
	ELSEIF(disableTRIG)
		mural.disable()
		disable()
		
	ENDIF

ENDEVENT

; // when the player leaves the trigger turn off the glow
EVENT onTriggerLeave(OBJECTREFERENCE obj)
	
	IF(glowTRIG)
		IF(obj == game.getPlayer())
			glow.Stop(mural)

		ENDIF

	ENDIF

ENDEVENT


