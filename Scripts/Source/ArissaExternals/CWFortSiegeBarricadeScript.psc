Scriptname CWFortSiegeBarricadeScript extends ReferenceAlias  

Keyword Property CWFortBarricadeMutualDistructionLink Auto

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	CWFortSiegeScript CWFortSiegeS = GetOwningQuest() as CWFortSiegeScript
	
	ObjectReference myLink = GetReference().GetLinkedRef(CWFortBarricadeMutualDistructionLink)
	
	if myLink
		myLink.DamageObject(9999)
	
	EndIf
	
	if aiCurrentStage == CWFortSiegeS.BarricadeDestructionStageToCheckFor
		CWFortSiegeS.CheckBarricadesDestroyedThenSetStage()
	EndIf
	
	
EndEvent
