ScriptName MS01NeposScript extends ReferenceAlias

Event OnUpdate()

; 	debug.Trace(self + "checking if Nepos is in dialogue with player")
	If (Self.GetActorRef().IsInDialogueWithPlayer() == False) && (GetOwningQuest().GetStageDone(80) == 1)		
; 		debug.Trace(self + "player is out of dialogue with Nepos, start combat")
		GetOwningQuest().SetStage(82)
		UnRegisterforUpdate()
	EndIf
	
EndEvent