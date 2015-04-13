Scriptname MS08SaadiaAmbushTriggerScript extends ObjectReference  

ReferenceAlias Property MS08Saadia  Auto  

Quest Property MS08  Auto  

scene Property MS08SaadiaAmbushScene  Auto  

int Property SaadiaIn  Auto  

int Property PlayerIn  Auto  


Event OnTriggerEnter (ObjectReference ActionRef)

	if MS08.GetStage() == 20
		if ActionRef == MS08Saadia.GetReference()
			if PlayerIn == 1
				MS08SaadiaAmbushScene.Start()
				Disable()
			else
				SaadiaIn=1
			endif
		elseif ActionRef == Game.GetPlayer()
			if SaadiaIn == 1
				MS08SaadiaAmbushScene.Start()
				Disable()
			else
				PlayerIn=1
			endif	
		endif
	endif

EndEvent


Event OnTriggerLeave (ObjectReference ActionRef)

	if MS08.GetStage() == 20
		if ActionRef == MS08Saadia.GetReference()
			SaadiaIn=0
		elseif ActionRef == Game.GetPlayer()
			PlayerIn=0
		endif
	endif

EndEvent