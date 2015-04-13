ScriptName Favor013NPCScript extends ReferenceAlias

Event OnDeath(Actor akKiller)

	If GetOwningQuest().GetStage() == 10
		GetOwningQuest().SetStage(15)
	ElseIf GetOwningQuest().GetStage() == 0
		GetOwningQuest().SetStage(200)
	EndIf

EndEvent