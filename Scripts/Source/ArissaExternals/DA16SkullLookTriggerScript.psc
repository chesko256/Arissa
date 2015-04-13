Scriptname DA16SkullLookTriggerScript extends ObjectReference  Conditional

ObjectReference Property pErandur Auto
Scene Property pSkullScene Auto
int Property pDoOnce Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDoOnce == 0
		if akActionRef == pErandur
			pSkullScene.Start()
			pDoOnce = 1
		endif
	endif

endEvent