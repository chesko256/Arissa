ScriptName MaceofMolagBalActivatorScript extends ReferenceAlias

Event OnUpdate()

	If (GetRef().IsInDialogueWithPlayer() == False) && (GetOwningQuest().GetStageDone(80) == 0)
		GetRef().Activate(Game.GetPlayer())
	EndIf
	
EndEvent