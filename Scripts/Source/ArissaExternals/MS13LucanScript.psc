ScriptName MS13LucanScript Extends ReferenceAlias

ReferenceAlias Property pCamilla Auto

Event OnDeath(Actor akKiller)

	If GetOwningQuest().IsObjectiveDisplayed(40)
		GetOwningQuest().SetObjectiveFailed(40, 1)
		GetOwningQuest().SetObjectiveDisplayed(45, 1)
	EndIf
	
	If (pCamilla.GetActorRef().IsDead() == True)
		GetOwningQuest().SetStage(200)
	EndIf

EndEvent
