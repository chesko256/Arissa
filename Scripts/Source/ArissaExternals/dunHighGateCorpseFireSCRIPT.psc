Scriptname dunHighGateCorpseFireSCRIPT extends OBJECTREFERENCE  

SPELL PROPERTY flameCloak AUTO
BOOL doOnce=FALSE

EVENT onLOAD()
	
	IF(doOnce)
		flameCloak.cast(SELF)
		doOnce = TRUE
	ENDIF

ENDEVENT
