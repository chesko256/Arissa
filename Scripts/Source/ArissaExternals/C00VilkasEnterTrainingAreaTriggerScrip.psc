Scriptname C00VilkasEnterTrainingAreaTriggerScrip extends ObjectReference  


Quest Property C00 auto
ReferenceAlias Property Vilkas auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Vilkas.GetReference() && C00.GetStage() == 20)
		Utility.Wait(10)
		if (Vilkas.GetActorReference().GetCombatState() != 1)
			(C00 as CompanionsHousekeepingScript).PlayerIgnoredVilkasOutside = true
			Vilkas.GetActorReference().EvaluatePackage()
		endif
		Delete()
	endif
EndEvent

