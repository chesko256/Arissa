scriptName dunTreasMapScript extends ObjectReference

Keyword property myKeyword auto
Container property myTreasChest auto

ObjectReference myLink
bool doOnce

;****************************

;Event onLoad()
;	if(getLinkedRef(myKeyword))
;		myLink = getLinkedRef(myKeyword) as ObjectReference
;	endif
;endEvent

;****************************

Event onCellLoad()
	if(getLinkedRef(myKeyword))
		myLink = getLinkedRef(myKeyword) as ObjectReference
	endif

	;used to add note to linkedRef if it has one
	if ((doOnce == FALSE) && getLinkedRef())
		getLinkedRef().addItem(self, 1, true)
		doOnce = TRUE
	endif
	
endEvent

;****************************

Auto STATE waiting
	Event onContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if(akNewContainer == game.getPlayer())
			gotoState ("done")
			myLink.enable()
			myLink.placeAtMe(myTreasChest, 1, true)
		endif
	endEvent

	Event onRead()
		gotoState ("done")
		myLink.enable()
		myLink.placeAtMe(myTreasChest, 1, true)
	endEvent
endState

;****************************

STATE done
	;do nothing
	EVENT onRead()
		;do nothing
	endEVENT

	EVENT onContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		;do nothing
	endEVENT
endSTATE

;****************************