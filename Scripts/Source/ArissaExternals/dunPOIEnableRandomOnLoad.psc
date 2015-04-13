scriptName dunPOIEnableRandomOnLoad extends ObjectReference
{On load, randomly enables or disables the references.}

ObjectReference property Object1 Auto
ObjectReference property Object2 Auto
ObjectReference property Object3 Auto
ObjectReference property Object4 Auto
ObjectReference property Object5 Auto
Quest property QuestToStart Auto

Event OnLoad()
	QuestToStart.SetStage(10)
	if (Object1 != None)
		if (!(Object1 as Actor).IsDead() && Utility.RandomInt(0, 2) == 1)
			Object1.Enable()
		Else
			Object1.Disable()
		EndIf
	EndIf
	if (Object2 != None)
		if (!(Object2 as Actor).IsDead() && Utility.RandomInt(0, 2) == 1)
			Object2.Enable()
		Else
			Object2.Disable()
		EndIf
	EndIf
	if (Object3 != None)
		if (!(Object3 as Actor).IsDead() && Utility.RandomInt(0, 2) == 1)
			Object3.Enable()
		Else
			Object3.Disable()
		EndIf
	EndIf
	if (Object4 != None)
		if (!(Object4 as Actor).IsDead() && Utility.RandomInt(0, 2) == 1)
			Object4.Enable()
		Else
			Object4.Disable()
		EndIf
	EndIf
	if (Object5 != None)
		if (!(Object5 as Actor).IsDead() && Utility.RandomInt(0, 2) == 1)
			Object5.Enable()
		Else
			Object5.Disable()
		EndIf
	EndIf
EndEvent