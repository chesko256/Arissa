Scriptname WE100ObjItemScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
	GetOwningQuest().SetStage(100)
  endIf
endEvent

