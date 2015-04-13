Scriptname MG02OrbTriggerScript extends ObjectReference  

Quest Property MG02  Auto  
int DoOnce



Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if DoOnce == 0
			MG02QuestScript MG02Script = MG02 as MG02QuestScript
			MG02Script.OrbFound = 1
			MG02TolfdirEyeScene.Start()
			DoOnce = 1
			Disable()
		endif
	endif

EndEvent
	
Scene Property MG02TolfdirEyeScene  Auto  
