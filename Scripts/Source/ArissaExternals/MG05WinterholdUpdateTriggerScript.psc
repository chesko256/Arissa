Scriptname MG05WinterholdUpdateTriggerScript extends ObjectReference  Conditional

Quest Property MG05  Auto  

Int Property BridgeWarning Auto  Conditional


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()

		if Self == MG05WinterholdTriggerRef
			if MG01.GetStage() < 30
				if BridgeWarning == 0
					BridgeWarning=1
					BridgeWarningScene.Start()
					MG01FaraldaAlias.GetActorReference().EvaluatePackage()
				endif
			endif
		endif
		if MG05.GetStage() >= 10
			if MG05.GetStage() < 40
				MG05.SetStage(40)
			endif
		endif
	endif

EndEvent
Quest Property MG01  Auto  

scene Property BridgeWarningScene  Auto  

ReferenceAlias Property MG01FaraldaAlias  Auto  

ObjectReference Property MG05WinterholdTriggerRef  Auto  
