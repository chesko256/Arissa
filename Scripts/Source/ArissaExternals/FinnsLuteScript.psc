Scriptname FinnsLuteScript extends ReferenceAlias  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer()
		If BardsCollegeLute.GetStage() == 20
			BardsCollegeLute.SetStage(40)
		Else
			BardsCollegeLute.SetStage(15)
		EndIf
	EndIf
EndEvent

Quest Property BardsCollegeLute  Auto  
