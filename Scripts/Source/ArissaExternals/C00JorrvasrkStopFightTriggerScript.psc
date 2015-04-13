Scriptname C00JorrvasrkStopFightTriggerScript extends ObjectReference  

Quest Property C00JorrvaskrFight auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (C00JorrvaskrFight.IsRunning() && !(C00JorrvaskrFight as C00JorrvaskrFightSceneScript).CountingDown)
			Utility.Wait(5.0)
			(C00JorrvaskrFight as C00JorrvaskrFightSceneScript).FightFinish()
			Delete()
		endif
	endif
EndEvent
