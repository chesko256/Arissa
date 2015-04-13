ScriptName MS13CamillaScript Extends ReferenceAlias

ReferenceAlias Property pLucan Auto

Event OnDeath(Actor akKiller)

	If (pLucan.GetActorRef().IsDead() == True)
		GetOwningQuest().SetStage(200)
	EndIf

EndEvent
