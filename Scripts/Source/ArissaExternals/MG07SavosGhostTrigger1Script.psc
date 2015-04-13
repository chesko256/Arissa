Scriptname MG07SavosGhostTrigger1Script extends ObjectReference  

ReferenceAlias Property SavosGhost  Auto  

Scene Property MG07GhostScene  Auto  


Event OnTrigger (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if Game.GetPlayer().IsInCombat() == False
				SavosGhost.GetReference().Moveto(GetLinkedRef())
				SavosGhost.GetReference().Enable(True)
				While SavosGhost.GetReference().Is3DLoaded() == False
					Utility.Wait(0.1)
				endwhile
				MG07GhostScene.Start()
				Disable()
		endif
	endif

EndEvent