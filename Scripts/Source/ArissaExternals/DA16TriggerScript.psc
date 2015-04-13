Scriptname DA16TriggerScript extends ObjectReference  Conditional

Quest Property pDA16Quest  Auto  Conditional
Scene Property pDA16FirstDreamstateScene  Auto  Conditional
int Property pDA16FirstSceneStarted  Auto  Conditional

event OnTriggerEnter (objectReference activateRef)

	if activateRef == Game.GetPlayer()
		if pDA16FirstSceneStarted == 0
			pDA16FirstDreamstateScene.Start()
			pDA16FirstSceneStarted == 1
		endif
	endif

endEvent