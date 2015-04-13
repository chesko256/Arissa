Scriptname CWMission09DocumentsScript extends ReferenceAlias  
{Script on CWMission09 DocumentsImperial and DocumentsSons aliases.}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer() && GetOwningQuest().GetStagedone(200) == False
		GetOwningQuest().SetStage(100)
	EndIf

EndEvent

