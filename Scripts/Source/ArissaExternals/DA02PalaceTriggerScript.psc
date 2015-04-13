Scriptname DA02PalaceTriggerScript extends ReferenceAlias  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		(GetOwningQuest() as DA02Script).processPalaceTrigger(GetReference(), True)
	EndIf

EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		(GetOwningQuest() as DA02Script).processPalaceTrigger(GetReference(), False)
	EndIf

EndEvent


