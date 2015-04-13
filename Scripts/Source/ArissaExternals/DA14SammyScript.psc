Scriptname DA14SammyScript extends ReferenceAlias  

ReferenceAlias Property DA14GiantAlias  Auto  

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		if GetOwningQuest().GetStage() == 50
			GetOwningQuest().SetStage(75)
			DA14GiantAlias.GetActorRef().StartCombat(Game.GetPlayer())
			GetActorRef().EvaluatePackage()
		endif
	endif
endEvent
