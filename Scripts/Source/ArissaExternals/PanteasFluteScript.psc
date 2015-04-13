Scriptname PanteasFluteScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		If BardsCollegeFlute.GetStage() == 20
			BardsCollegeFlute.SetStage(40)
		Else
			BardsCollegeFlute.SetStage(15)
		EndIf
	EndIf
EndEvent

Quest Property BardsCollegeFlute  Auto  
