ScriptName MS01DonnelScript extends ReferenceAlias

ReferenceAlias Property Ildene Auto

Event OnDeath(Actor akKiller)

	If Ildene.GetActorRef().IsDead()	
		GetOwningQuest().SetStage(55)	
	EndIf

EndEvent