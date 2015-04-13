Scriptname MG02Saarthal02SceneTriggerScript extends ObjectReference  

Scene Property MG02Scene  Auto  

ReferenceAlias Property MG02Tolfdir  Auto  

int DoOnce


Event OnTriggerEnter(ObjectReference ActionRef)

;If this hasn't already been done, and Tolfdir steps into trigger, start the associated scene

	if DoOnce == 0	
		if ActionRef == MG02Tolfdir.GetReference() || ActionRef == Game.GetPlayer()
	
			MG02Scene.Start()
			DoOnce = 1
		endif
	endif

EndEvent