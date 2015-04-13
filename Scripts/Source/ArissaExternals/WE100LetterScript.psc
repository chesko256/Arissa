Scriptname WE100LetterScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

; ;debug.trace(self + "OnContainerChanged")

  if akNewContainer == Game.GetPlayer()
	GetOwningQuest().SetStage(10)
  endIf
endEvent

