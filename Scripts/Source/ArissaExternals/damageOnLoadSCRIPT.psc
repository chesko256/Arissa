Scriptname damageOnLoadSCRIPT extends OBJECTREFERENCE  

BOOL DOONCE
REFERENCEALIAS PROPERTY draugr AUTO

EVENT onLoad()

	IF(DOONCE)
	
		ACTOR lDraugr = draugr.getActorReference()
		lDraugr.damageAV("health", (lDraugr.getBaseAV("health") - 10))
		DOONCE = FALSE
	ENDIF

ENDEVENT
