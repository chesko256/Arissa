Scriptname T01DibellasAltarScript extends ObjectReference

Quest Property T01 auto

Event OnActivate(ObjectReference akActivator)
	if (Game.GetPlayer() == akActivator)
		if (T01.GetStage() >= 100)
; 			Debug.Trace("T01: Registering for IdleFurnitureExit.")
			RegisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
			Utility.Wait(20)
			if (!T01.GetStageDone(200))
; 				Debug.Trace("T01: Unregistering for IdleFurnitureExit.")
				UnregisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
				T01.SetStage(200)
			endif
		endif
	endif
EndEvent


Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if (asEventName == "IdleFurnitureExit" && akSource == Game.GetPlayer())
    	UnregisterForAnimationEvent(Game.GetPlayer(), "IdleFurnitureExit")
		T01.SetStage(200)
    endif
EndEvent


