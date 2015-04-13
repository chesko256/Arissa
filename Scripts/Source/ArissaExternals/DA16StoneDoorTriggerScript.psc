Scriptname DA16StoneDoorTriggerScript extends ObjectReference  Conditional

Scene Property pDoorScene  Auto  
ObjectReference Property pErandur Auto
int Property pDoOnce Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDoOnce == 0
		if akActionRef == pErandur
			pDoorScene.Start()
			pDoOnce = 1
		endif
	endif

endEvent