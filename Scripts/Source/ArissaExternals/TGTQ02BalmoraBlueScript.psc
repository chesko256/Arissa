Scriptname TGTQ02BalmoraBlueScript extends ReferenceAlias  Conditional

Quest Property pTGTQ02Quest Auto
ObjectReference Property pTGTQ02CaptainChest  Auto  Conditional
TGTQ02QuestScript Property pTGTQ02QS  Auto  Conditional

Event OnContainerchanged(ObjectReference NewContainer, ObjectReference OldContainer)

	if pTGTQ02Quest.GetStage() < 30
		if NewContainer == Game.GetPlayer()
			pTGTQ02Quest.SetStage(30)
		endif
	endif

	if pTGTQ02Quest.GetStage() >= 30
		if pTGTQ02Quest.IsObjectiveDisplayed(30) == 1
			if NewContainer == pTGTQ02CaptainChest
				pTGTQ02Quest.SetObjectiveCompleted(30,1)
				pTGTQ02Quest.SetObjectiveDisplayed(40,1)
				pTGTQ02QS.pTGTQ02Planted = 1
			endif			
		endif
	endif

	if pTGTQ02Quest.GetStage() >= 30
		if pTGTQ02Quest.IsObjectiveDisplayed(40) == 1
			if NewContainer == Game.GetPlayer()
				pTGTQ02Quest.SetObjectiveCompleted(30,0)
				pTGTQ02Quest.SetObjectiveDisplayed(30,1)
				pTGTQ02Quest.SetObjectiveDisplayed(40,0)
				pTGTQ02QS.pTGTQ02Planted = 0
			endif			
		endif
	endif

EndEvent
