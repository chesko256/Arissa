Scriptname TG02SceneStarterTriggerScript extends ObjectReference  Conditional

Quest Property pTG02Quest  Auto  Conditional
ReferenceAlias Property pTG02BrynjolfAlias Auto
TG02QuestScript Property pTG02QS Auto
int Property pPlayerDone Auto
int Property pBrynDone Auto

event onTriggerEnter (objectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG02Quest.IsRunning() == 1
			if pPlayerDone == 0
				pTG02QS.pTG02PlayerPathDone = 1
				pTG02QS.ScenePlay()
				pPlayerDone = 1
			endif
		endif
	endif

	if akActionRef == pTG02BrynjolfAlias.GetActorRef()
		if pTG02Quest.IsRunning() == 1
			if pBrynDone == 0
				pTG02QS.pTG02BrynPathDone = 1
				pTG02QS.ScenePlay()
				pBrynDone = 1
			endif
		endif
	endif

endEvent