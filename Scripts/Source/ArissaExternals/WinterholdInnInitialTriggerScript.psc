Scriptname WinterholdInnInitialTriggerScript extends ReferenceAlias  

Scene Property InitialScene  Auto  

int DoOnce

Event OnTriggerEnter(ObjectReference AkActionRef)


	If AkActionRef == Game.GetPlayer()
		if DoOnce == 0
			InitialScene.Start()
			DoOnce = 1
		endif
	endif

EndEvent
