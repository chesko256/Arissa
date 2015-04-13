ScriptName MS01IldeneScript extends ReferenceAlias

ReferenceAlias Property Donnel Auto

Event OnDeath(Actor akKiller)

	If Donnel.GetActorRef().IsDead()	
		GetOwningQuest().SetStage(55)	
	EndIf

EndEvent