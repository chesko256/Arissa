Scriptname DA16LibraryCommentSceneTrigger extends ObjectReference  Conditional

Scene Property pLibraryScene Auto
int Property pDoOnce Auto
ObjectReference Property pErandur Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDoOnce == 0
		if akActionRef == pErandur
			pLibraryScene.Start()
			pDoOnce = 1
		endif
	endif

endEvent