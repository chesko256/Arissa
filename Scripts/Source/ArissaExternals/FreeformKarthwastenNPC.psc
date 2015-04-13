ScriptName FreeformKarthwastenNPC extends ReferenceAlias

ReferenceAlias Property Ainethach Auto

Event OnDeath(Actor akKiller)

	If (GetOwningQuest().GetStageDone(20) == 1)
		GetOwningQuest().SetStage(25)
	Else
		GetOwningQuest().SetStage(300)
	EndIf
		
	If (Ainethach.GetActorRef().IsDead() == True)
		GetOwningQuest().SetStage(300)
	EndIf

EndEvent