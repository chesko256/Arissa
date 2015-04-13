ScriptName DA11ShrineRoomTriggerScript extends ReferenceAlias

ReferenceAlias Property pVerulus Auto
DA11QuestScript var
DA11QuestScript Property pDA11QuestScript auto

Event OnTriggerEnter(ObjectReference akActionRef)

	If (akActionRef == pVerulus.GetActorRef())
; 		Debug.Trace("Set iVerulusAtShrine to 1")
; 		Debug.Trace("pDA11QuestScript = " + pDA11QuestScript)
		pDA11QuestScript.iVerulusAtShrine = 1
		If (GetOwningQuest().GetStageDone(45) == 0)
			GetOwningQuest().SetStage(45)
		EndIf
	EndIf
	
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)

	If (akActionRef == pVerulus.GetActorRef())
; 		Debug.Trace("Set iVerulusAtShrine to 0")
		pDA11QuestScript.iVerulusAtShrine = 0
	EndIf	
	
EndEvent	