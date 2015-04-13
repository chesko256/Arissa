Scriptname RjornsDrumScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		If BardsCollegeDrum.GetStage() == 20
			BardsCollegeDrum.SetStage(40)
		Else
			BardsCollegeDrum.SetStage(15)
		EndIf
	EndIf
EndEvent

Quest Property BardsCollegeDrum  Auto  
