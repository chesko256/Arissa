Scriptname MGClassroomTriggerScript extends ObjectReference  

Quest Property MG01  Auto  

Scene Property MG01ClassroomScene  Auto  

Quest Property MG04  Auto  

Scene Property MG04ClassroomScene  Auto  

int MG01DoOnce
int MG04DoOnce

Event OnTriggerEnter (ObjectReference AkActionRef)

;Triggers MG01 classroom scene when player gets close enough
;note that this will skip the tour if the player has wandered away from it

	if AkActionRef == Game.GetPlayer()
		if MG01.GetStage() >= 20
			if MG01DoOnce == 0
				MG01ClassroomScene.Start()
				if MG01.GetStage() < 50
					MG01.SetStage(50)
				endif
				MG01DoOnce = 1
			endif
		endif

	endif

EndEvent