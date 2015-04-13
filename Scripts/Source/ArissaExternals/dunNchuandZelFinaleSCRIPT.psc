Scriptname dunNchuandZelFinaleSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY steamCent AUTO
OBJECTREFERENCE PROPERTY steamCentStatic AUTO
OBJECTREFERENCE PROPERTY steamSpiderA AUTO
OBJECTREFERENCE PROPERTY steamSpiderB AUTO
OBJECTREFERENCE PROPERTY steamSpiderC AUTO
OBJECTREFERENCE PROPERTY steamSpiderD AUTO

OBJECTREFERENCE PROPERTY falmerA AUTO
OBJECTREFERENCE PROPERTY falmerB AUTO
OBJECTREFERENCE PROPERTY falmerC AUTO
OBJECTREFERENCE PROPERTY falmerD AUTO
OBJECTREFERENCE PROPERTY falmerE AUTO
OBJECTREFERENCE PROPERTY falmerF AUTO
OBJECTREFERENCE PROPERTY falmerG AUTO

OBJECTREFERENCE PROPERTY oldFalmerA AUTO
OBJECTREFERENCE PROPERTY oldFalmerB AUTO
OBJECTREFERENCE PROPERTY oldFalmerC AUTO
OBJECTREFERENCE PROPERTY oldFalmerD AUTO
OBJECTREFERENCE PROPERTY oldFalmerE AUTO

BOOL doOnce=TRUE

QUEST PROPERTY myQuest AUTO

EVENT onActivate(OBJECTREFERENCE obj)

	
	IF(doOnce)
	
		; //disable the old ones
		oldFalmerA.disable()
		oldFalmerB.disable()
		oldFalmerC.disable()
		oldFalmerD.disable()
		oldFalmerE.disable()
		
		; //enable the dwarven stuff
		steamCent.enable()
		steamCentStatic.disable()
		steamSpiderA.enable()
		steamSpiderB.enable()
		steamSpiderC.enable()
		steamSpiderD.enable()
		
		; //enable the falmer guys
		falmerA.enable()
		falmerB.enable()
		falmerC.enable()
		falmerD.enable()
		falmerE.enable()
		falmerF.enable()
		falmerG.enable()
		
		myQuest.setStage(100)
		
		; //only do it once
		doOnce = FALSE
	
	ENDIF

ENDEVENT

