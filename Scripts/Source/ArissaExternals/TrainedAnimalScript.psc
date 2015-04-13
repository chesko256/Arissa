ScriptName TrainedAnimalScript extends ReferenceAlias

DialogueFollowerScript Property DialogueFollower Auto

Event OnUpdateGameTime()

	;kill the update if the follower isn't waiting anymore
	If Self.GetActorRef().GetAv("WaitingforPlayer") == 0
		UnRegisterForUpdateGameTime()
	Else
		DialogueFollower.DismissAnimal()
		UnRegisterForUpdateGameTime()
	EndIf	
	
EndEvent

Event OnUnload()

	;if follower unloads while waiting for the player, wait three days then dismiss him.
	If Self.GetActorRef().GetAv("WaitingforPlayer") == 1
		(GetOwningQuest() as DialogueFollowerScript).AnimalWait()
	EndIf

EndEvent

Event OnDeath(Actor akKiller)

	PlayerAnimalCount.SetValue(0)
	Self.Clear()
	
EndEvent
GlobalVariable Property PlayerAnimalCount  Auto  
