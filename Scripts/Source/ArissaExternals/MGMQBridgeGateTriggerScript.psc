Scriptname MGMQBridgeGateTriggerScript extends ObjectReference  



Event OnTriggerEnter (ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MGMainQuestBridge.GetStage() == 10
			GateRef.SetOpen(False)
			MGMainQuestBridge.SetStage(200)
		endif
	endif

EndEvent
quest Property MGMainQuestBridge  Auto  
objectreference Property GateRef  Auto