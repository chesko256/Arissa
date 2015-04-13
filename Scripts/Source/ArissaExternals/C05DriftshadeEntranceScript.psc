Scriptname C05DriftshadeEntranceScript extends ObjectReference  

Quest Property C05 auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		(C05 as C05QuestScript).PlayerOnCorrectSideOfDoor = false
	endif
EndEvent