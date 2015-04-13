Scriptname DA06CaveTrigger extends ObjectReference  

Quest Property DA06  Auto  

ReferenceAlias Property DA06Yamarz  Auto  
int DoOnce
int YamarzReady
int PlayerReady


Event OnTriggerEnter (ObjectReference AkActivator)

	if DA06.GetStage() == 80
		if DoOnce == 0 		
			if AkActivator == DA06Yamarz.GetReference()
				YamarzReady = 1
				if PlayerReady == 1
					DA06CaveScene.Start()
					DoOnce == 1		
				endif
			endif
			if AkActivator == Game.GetPlayer()
				PlayerReady = 1
				if YamarzReady == 1
					DA06CaveScene.Start()
					DoOnce == 1
				endif
			endif
		endif
	endif

EndEvent
Scene Property DA06CaveScene  Auto  
