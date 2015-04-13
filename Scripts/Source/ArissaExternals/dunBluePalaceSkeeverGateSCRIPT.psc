Scriptname dunBluePalaceSkeeverGateSCRIPT extends ObjectReference  

BOOL PROPERTY FIRSTGATE AUTO
BOOL PROPERTY SECONDGATE AUTO
BOOL PROPERTY FINALGATE AUTO

OBJECTREFERENCE PROPERTY doorOpen AUTO

; first gate objects
OBJECTREFERENCE PROPERTY portFirst AUTO

; second gate objects
OBJECTREFERENCE PROPERTY portSecond AUTO

; final gate objects
OBJECTREFERENCE PROPERTY portFinal AUTO

EVENT onTRIGGERENTER(OBJECTREFERENCE obj)
	IF(obj as ACTOR == game.getPlayer())
		
		IF(FIRSTGATE)
			portFirst.activate(doorOpen)
			disable()
		
		ELSEIF(SECONDGATE)
			portSecond.activate(doorOpen)
			disable()
		
		ELSEIF(FINALGATE)
			portFinal.activate(doorOpen)
			disable()
		
		ENDIF
	
	ENDIF

ENDEVENT
