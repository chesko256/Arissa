Scriptname MG02Cell02TolfdirMoveTriggerScript extends ObjectReference  

ReferenceAlias Property MG02TolfdirAlias  Auto  

Quest Property MG02  Auto  

ObjectReference Property Marker  Auto


;When the player hits this trigger, we move Tolfdir to a marker around the corner and have him catch up

Event OnTriggerEnter (ObjectReference ActionRef)

MG02QuestScript QuestScript = MG02 as MG02QuestScript

	if ActionRef == Game.GetPlayer()
		if QuestScript.Cell02TolfdirMove == 0
			QuestScript.Cell02TolfdirMove = 1
			MG02TolfdirAlias.GetReference().MoveTo(Marker)
			MG02TolfdirAlias.GetActorReference().EvaluatePackage()
			MoveScene.Start()
		endif
	endif

		


EndEvent
Scene Property MoveScene  Auto  
