ScriptName MS02SkoomaScript extends ReferenceAlias

Quest Property pMS02 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	If akNewContainer == Game.GetPlayer() && pMS02.GetStageDone(7) == 1 && pMS02.GetStageDone(8) == 0
		pMS02.SetStage(8)
	EndIf
	
EndEvent 