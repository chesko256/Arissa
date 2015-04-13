Scriptname MG02Saarthal01LeverScript extends ObjectReference  

Quest Property MG02  Auto  

int DoOnce  

; //phil put this here
OBJECTREFERENCE PROPERTY collisionVolume AUTO
OBJECTREFERENCE PROPERTY spikeMarker AUTO
OBJECTREFERENCE PROPERTY gateMarker AUTO
BOOL PROPERTY spikeChain AUTO
BOOL PROPERTY gateChain AUTO
BOOL leverOnce=TRUE


Event OnActivate(ObjectReference ActionRef)

MG02QuestScript QuestScript = MG02 as MG02QuestScript

	if ActionRef == Game.GetPlayer()
		if DoOnce == 0
			DoOnce == 1
			QuestScript.MG02Saarthal01LeverCount += 1

			if QuestScript.MG02Saarthal01LeverCount != 2
				MG02TolfdirAlias.GetActorReference().EvaluatePackage()
			endif
		endif
	endif
	
	; /////////////////////////////////////////////////
	; // PHIL'S MISHMASH
	IF(actionRef == game.getPlayer() && leverOnce)

		IF(spikeChain)
			IF(spikeMarker.isEnabled())
				spikeMarker.disable()
			ELSE
				spikeMarker.enable()
			ENDIF
		ENDIF
		
		IF(gateChain)
			IF(gateMarker.isEnabled())
				gateMarker.disable()
			ELSE
				gateMarker.enable()
			ENDIF
		ENDIF
	
		IF(spikeMarker.isEnabled() && gateMarker.isEnabled())
			; //disable the blocking volume
			collisionVolume.disable()
			leverOnce = FALSE
		ELSE
		ENDIF
	
	ENDIF

EndEvent
ReferenceAlias Property MG02TolfdirAlias  Auto  
