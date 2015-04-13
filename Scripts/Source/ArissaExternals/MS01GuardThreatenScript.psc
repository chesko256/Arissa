ScriptName MS01GuardThreatenScript extends ReferenceAlias

Event OnUnload()

	If GetOwningQuest().GetStageDone(20) == 1
		GetOwningQuest().SetStage(100)
	EndIf

EndEvent