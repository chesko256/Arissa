Scriptname MS01OnUnloadScript extends ReferenceAlias  

Event OnUnload()
	If (GetOwningQuest().GetStage() == 145) || (GetOwningQuest().GetStage() == 155)
		GetOwningQuest().setStage(160)
	EndIf
endEvent