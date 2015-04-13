Scriptname C00FarkasNarrationScript extends ObjectReference  

Quest Property C00 auto
ReferenceAlias Property Farkas auto
Scene Property Narration auto
Package Property NarrationPackage auto
bool Property LastSceneTrigger auto

Event OnTriggerEnter(ObjectReference akActivator)
	if ( (Farkas.GetReference() == akActivator) && (Farkas.GetActorReference().GetCurrentPackage() == NarrationPackage) )
		Narration.Start()
		Delete()
	elseif (LastSceneTrigger)
		if ( (Game.GetPlayer() == akActivator) && (Farkas.GetActorReference().GetCurrentPackage() == NarrationPackage) && ((C00 as CompanionsHousekeepingScript).FarkasLastSceneStarted == false) )
			Narration.Start()
			Delete()
		endif
	endif
EndEvent
