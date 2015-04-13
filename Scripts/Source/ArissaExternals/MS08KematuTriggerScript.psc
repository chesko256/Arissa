Scriptname MS08KematuTriggerScript extends ReferenceAlias  

Scene Property KematuScene  Auto  

int DoOnce

Event OnTriggerEnter (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if DoOnce == 0 
			KematuScene.Start()
			DoOnce= 1
		endif
	endif

EndEvent