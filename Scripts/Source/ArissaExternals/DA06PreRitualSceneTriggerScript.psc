Scriptname DA06PreRitualSceneTriggerScript extends ObjectReference  Conditional

ReferenceAlias Property Yamarz  Auto  

ReferenceAlias Property Atub  Auto  

scene Property DA06PreRitualScene  Auto  

int Property NewProperty  Auto  

quest Property DA06  Auto

int DoOnce

Event OnTrigger(ObjectReference ActionRef)

	if DoOnce == 0
		if DA06.GetStage() == 60
			if ActionRef == Game.GetPlayer()
				if Game.GetPlayer().GetDistance(Atub.GetReference()) < 1000
					if Game.GetPlayer().GetDistance(Yamarz.GetReference()) < 1000
						DA06PreRitualScene.Start()
						DoOnce == 1
					endif
				endif
			endif
		endif
	endif

EndEvent					