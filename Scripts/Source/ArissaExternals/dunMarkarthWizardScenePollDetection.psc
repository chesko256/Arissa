ScriptName dunMarkarthWizardScenePollDetection extends Quest

bool isPolling = False

Function PollDetection(ReferenceAlias A1, ReferenceAlias A2, Scene CurrentScene)
	Actor Actor1 = A1.GetActorRef()
	Actor Actor2 = A2.GetActorRef()
	While (CurrentScene.IsPlaying() && !Actor1.IsInCombat() && !Actor2.IsInCombat())
		Utility.Wait(1)
		if (Game.GetPlayer().IsDetectedBy(Actor1) || Game.GetPlayer().IsDetectedBy(Actor2))
			CurrentScene.Stop()
		EndIf
	EndWhile
EndFunction