Scriptname MGRDestructionBook04Script extends ReferenceAlias  

Book Property MGRDestructionFinal  Auto  

Event OnEquipped(Actor AkActor)

	if AkActor == Game.GetPlayer()
		Game.GetPlayer().Additem(MGRDestructionFinal, 1)
		Self.GetReference().Disable()
		MGRitual01.SetStage(200)
	endif

EndEvent
Quest Property MGRitual01  Auto  
