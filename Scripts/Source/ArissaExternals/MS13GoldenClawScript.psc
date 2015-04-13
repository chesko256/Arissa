scriptName MS13GoldenClawScript extends ReferenceAlias

Quest property MS13 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
;     Debug.Trace("Golden Claw has been added to player's inventory!")
	MS13.SetStage(40)
  endIf
endEvent