Scriptname MG07LeverUpdateEstormoScript extends ObjectReference  

quest Property MG07  Auto  

ReferenceAlias Property MG07Estormo  Auto  


Event OnActivate(ObjectReference ActionRef)

MG07QuestScript QuestScript = MG07 as MG07QuestScript

	if ActionRef == Game.GetPlayer()
		if QuestScript.EstormoUpdate == 0
			QuestScript.EstormoUpdate=1
			MG07Estormo.GetActorReference().EvaluatePackage()

		endif
	endif

EndEvent