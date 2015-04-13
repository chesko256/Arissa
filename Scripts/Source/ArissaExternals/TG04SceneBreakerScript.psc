Scriptname TG04SceneBreakerScript extends Actor  Conditional

TG04QuestScript Property pTG04QuestScript  Auto  Conditional
ReferenceAlias Property pTG04GulumEi  Auto  Conditional
Scene Property pTG04Scene  Auto  Conditional
Scene Property pTG04AlertedScene  Auto  Conditional
Quest Property pTG04Quest Auto Conditional

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	if pTG04Quest.GetStage() == 40
		if pTG04Scene.IsPlaying() == 1
			if pTG04QuestScript.pTG04SceneBreak == 0
				if (akTarget == Game.GetPlayer())
					pTG04Scene.Stop()
					pTG04AlertedScene.Start()
					pTG04QuestScript.pTG04SceneBreak = 1
				endif
			endif
		endif
	endif		

endEvent
