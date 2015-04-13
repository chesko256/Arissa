Scriptname MG01TestCastTriggerScript extends ObjectReference  

Quest Property MG01  Auto  

Spell Property Fireball  Auto  



Event OnTriggerEnter (ObjectReference ActionRef)

MG01QuestScript QuestScript = MG01 as MG01QuestScript

	if MG01.GetStage() == 3
		if ActionRef == Game.GetPlayer()
				MG01Tolfdir.GetActorReference().EvaluatePackage()
	
		endif
	endif

EndEvent
ReferenceAlias Property MG01Tolfdir  Auto  
