Scriptname karthspireRedoubtCageDoorSCRIPT extends ReferenceAlias  

QUEST PROPERTY karthQuest AUTO
OBJECTREFERENCE PROPERTY dragon AUTO
ACTORBASE PROPERTY dragonPlaced AUTO

;the cage to break
OBJECTREFERENCE PROPERTY cageA AUTO
OBJECTREFERENCE PROPERTY cageB AUTO
OBJECTREFERENCE PROPERTY cageC AUTO
OBJECTREFERENCE PROPERTY cageD AUTO

BOOL doOnce = FALSE

EVENT onACTIVATE(OBJECTREFERENCE objRef)

	IF(objRef as ACTOR == game.getPlayer() && doOnce == FALSE && self.getRef().isLocked() == FALSE)

		doOnce = TRUE
		self.getRef().playAnimation("open")
		
		utility.wait(0.5)
		
		self.getRef().disable()
		cageA.disable()
		cageB.disable()
		cageC.disable()
		cageD.disable()
		
		utility.wait(0.25)
		
		; dragon swap
		dragon.placeAtMe(dragonPlaced AS FORM, 1)
		dragon.disable()
		
					
	ENDIF

ENDEVENT
