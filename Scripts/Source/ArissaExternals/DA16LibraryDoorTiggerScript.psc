Scriptname DA16LibraryDoorTiggerScript extends ObjectReference  Conditional

ObjectReference Property pErandur Auto
Scene Property pLibraryDoorScene Auto
int Property pDoOnce Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDoOnce == 0
		if akActionRef == pErandur
			pLibraryDoorScene.Start()
			pDoOnce = 1
		endif
	endif

endEvent
