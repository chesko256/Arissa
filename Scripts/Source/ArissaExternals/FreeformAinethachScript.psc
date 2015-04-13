ScriptName FreeformAinethachScript extends ReferenceAlias

ReferenceAlias Property Atar Auto

Event OnDeath(Actor akKiller)

	If (GetOwningQuest().GetStageDone(30) == 1)
		GetOwningQuest().SetStage(35)
	Else
		GetOwningQuest().SetStage(300)
	EndIf
	
	If (Atar.GetActorRef().IsDead() == True)
		GetOwningQuest().SetStage(300)
	EndIf

EndEvent