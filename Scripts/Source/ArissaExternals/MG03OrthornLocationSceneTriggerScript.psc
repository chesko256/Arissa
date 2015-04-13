Scriptname MG03OrthornLocationSceneTriggerScript extends ObjectReference  

ReferenceAlias Property MG03Orthorn  Auto  

Scene Property MG03LocationScene  Auto  


int DoOnce


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == MG03Orthorn.GetReference()
		if DoOnce == 0 
			MG03LocationScene.Start()
			DoOnce = 1
		endif
	endif

EndEvent