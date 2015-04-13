Scriptname CWResolution01BarricadeScript extends ReferenceAlias  

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	if aiCurrentStage == 1
		;nothing happens - yet?
		
	ElseIf aiCurrentStage == 2
		;nothing happens - yet?
		
	ElseIf aiCurrentStage == 3
		;nothing happens - yet?
		
	ElseIf aiCurrentStage == 4
		GetOwningQuest().setStage(30)
	
		;finish destroying it
		GetReference().DamageObject(9999)
	
	EndIf
		
EndEvent
