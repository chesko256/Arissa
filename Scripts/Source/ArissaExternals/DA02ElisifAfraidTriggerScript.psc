Scriptname DA02ElisifAfraidTriggerScript extends ReferenceAlias  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer() && GetOwningQuest().GetStage() >= 50 && GetOwningQuest().GetStageDone(80) == False
		;make elisif hostile so she runs detection on the Player
		GetOwningQuest().setStage(60)
		
	EndIf

EndEvent
