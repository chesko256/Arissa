Scriptname MG06ObservatoryDoorScript extends ObjectReference

Scene Property MG06ParatusScene  Auto  

int DoOnce




Event OnActivate(ObjectReference ActionRef)

; Debug.Trace("Door Activated")



	if ActionRef == Game.GetPlayer()
		if DoOnce == 0 
			MG06ParatusScene.Start()
			DoOnce = 1
		endif
	endif

EndEvent