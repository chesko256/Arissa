Scriptname MGRitual04AugurTriggerScript extends ObjectReference  

ObjectReference Property AugurDoor  Auto  
Quest Property MGRitual04  Auto

int DoOnce


Event OnTriggerEnter(ObjectReference ActionRef)

	if DoOnce == 0
		if ActionRef == Game.GetPlayer()
			if MGRitual04.GetStage() == 10
				AugurDoor.Lock(false)
				AugurDoor.SetOpen()
				Utility.Wait(2)
				MGAugurFX.Enable(true)
				DoOnce == 1
			endif
		endif
	endif

EndEvent
ObjectReference Property MGAugurFX  Auto  
