scriptName dunTreasMapDragonBridgeScript extends ObjectReference

Keyword property myKeyword auto
ObjectReference myLink
bool doOnce

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
		endif
	endEvent

	Event onRead()
		gotoState ("done")
		myLink.enable()
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