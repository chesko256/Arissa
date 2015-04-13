Scriptname DarkwaterCavernDerkeethusMoveScript extends ObjectReference  

Quest Property RescueQuest auto
ReferenceAlias Property Derkeethus auto
ReferenceAlias Property DerkeethusSpot auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && RescueQuest.GetStage() < 20)
		Utility.Wait(10)
		Derkeethus.GetReference().MoveTo(DerkeethusSpot.GetReference())
	endif
EndEvent
