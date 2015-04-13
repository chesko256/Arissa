ScriptName DA07RazorPieceScript extends ReferenceAlias

Int Property iObjective Auto
Int Property iStage Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

if akNewContainer == Game.GetPlayer()
; 	debug.trace(self + "incrementing razor count")
	(GetOwningQuest() as DA07QuestScript).IncrementRazorCount()

	If GetOwningQuest().GetStageDone(10) == 1
		GetOwningQuest().SetObjectiveCompleted(iObjective, 1)
		GetOwningQuest().SetStage(iStage)
	EndIf
endIf

EndEvent