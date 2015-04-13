Scriptname TG04GulumEiScript extends ReferenceAlias  Conditional

TG04QuestScript Property pTG04QS  Auto  Conditional
Scene Property pTG04Scene  Auto  Conditional
Scene Property pTG04AlertScene Auto Conditional
Quest Property pTG04Quest Auto
ObjectReference Property pKillChest Auto
ObjectReference Property pDoortoBrinewater Auto
ReferenceAlias Property pDeedAlias Auto
ReferenceAlias Property pKillNoteAlias Auto
int Property pGulumDeathSetup Auto


Event OnUpdate()

	bool ContinueUpdating = true

	if pTG04Quest.GetStage() == 40
		if pTG04Scene.IsPlaying() == 1
			if Game.GetPlayer().IsDetectedBy(GetActorRef())
				if pTG04QS.pTG04SceneBreak == 0
					pTG04Scene.Stop()
					pTG04AlertScene.Start()
					pTG04QS.pTG04SceneBreak = 1
					ContinueUpdating = False
				endif
			endif
		endif
	endif

	if ContinueUpdating
		RegisterForSingleUpdate(0.50)
	endif

endEvent


Event OnDying(Actor akKiller)

	if pGulumDeathSetup == 0
		if pTG04Quest.GetStage() < 60
			pDoortoBrinewater.Lock(false)
			pKillChest.AddItem(pDeedAlias.GetRef())
			pKillChest.AddItem(pKillNoteAlias.GetRef())
				if pTG04Quest.IsObjectiveDisplayed(40) == 1
					pTG04Quest.setObjectiveFailed(40,1)
				endif
				if pTG04Quest.IsObjectiveDisplayed(50) == 1
					pTG04Quest.setObjectiveFailed(50,1)
				endif
			pTG04Quest.SetObjectiveDisplayed(55,1)
			pGulumDeathSetup = 1	
		endif
	endif

endEvent