Scriptname C00CloseToVilkasScript extends ObjectReference  

Quest Property C00 auto
ReferenceAlias Property Vilkas auto ; on C00
Package Property VilkasTrainingPackage auto

Event OnTriggerEnter(ObjectReference akActivator)
	if ( (C00.GetStage() == 20) && (Vilkas.GetActorReference().GetCurrentPackage() == VilkasTrainingPackage) )
		Vilkas.GetActorReference().EvaluatePackage()
	endif
EndEvent
