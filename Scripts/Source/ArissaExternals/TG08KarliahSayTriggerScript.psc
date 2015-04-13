Scriptname TG08KarliahSayTriggerScript extends ObjectReference  

int Property pTG08AStartScene  Auto  
Quest Property pTG08AQuest  Auto  


Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTG08AStartScene == 0
			if pTG08AQuest.GetStage() == 30
				pTG08AQuest.SetStage(35)
				pTG08AStartScene = 1
			endif
		endif
	endif


endEvent