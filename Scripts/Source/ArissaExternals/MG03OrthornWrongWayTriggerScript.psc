Scriptname MG03OrthornWrongWayTriggerScript extends ObjectReference  

Quest Property MG03  Auto  

Scene Property WrongWayScene Auto

int DoOnce


Event OnTriggerEnter(ObjectReference ActionRef)


	if DoOnce == 0
		if ActionRef == Game.GetPlayer()
			if MG03.GetStageDone(50)==1
				WrongWayScene.Start()
				DoOnce=1
			endif
		endif
	endif

EndEvent