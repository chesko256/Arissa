Scriptname TGLeadershipQuestScript extends Quest  Conditional
Cell Property pTGCell  Auto  Conditional
ObjectReference Property pMavenMarker  Auto  Conditional
ObjectReference Property pKarliahMarker  Auto  Conditional
Quest Property pTGLeadershipQuest Auto Conditional

Event OnUpdate()

	if pTGLeadershipQuest.GetStage() == 40
		if Game.GetPlayer().GetParentCell() != pTGCell
			pTGLeadershipQuest.SetStage(50)
		else
			RegisterforSingleUpdate(1)
		endif
	endif

endEvent

