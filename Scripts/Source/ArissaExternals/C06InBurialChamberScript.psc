Scriptname C06InBurialChamberScript extends ReferenceAlias

ReferenceAlias Property Eorlund auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		return
	endif
	
	Quest c06 = GetOwningQuest()
	C06QuestScript c06script = c06 as C06QuestScript
	if (c06.GetStage() >= 40)
		c06.SetStage(50)
		c06script.EorlundForceGreetInChamber = true
		Eorlund.GetActorReference().EvaluatePackage()
		GetReference().Disable()
	endif
endEvent
