Scriptname dunSoljundSoulGemHolderSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY gem AUTO
OBJECTREFERENCE PROPERTY marker AUTO
OBJECTREFERENCE PROPERTY statue AUTO

BOOL doOnce=FALSE

EVENT onTRIGGERLEAVE(OBJECTREFERENCE obj)

	IF(!doOnce)
		IF(obj == gem)
			marker.disable()
			statue.disable()
		ENDIF
	ENDIF

endEVENT
