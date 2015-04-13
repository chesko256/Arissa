Scriptname MQ101CartRiderScript extends ReferenceAlias  
{for cart riders to track exiting etc.}

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.trace(self + ": animation event received=" + asEventName)
	if asEventName == "ExitCartEnd"
		(GetOwningQuest() as MQ101QuestScript).IncrementExitCartCount(stageOnExit )
		; not in cart anymore
		UnRegisterForAnimationEvent(akSource, "ExitCartEnd")
		; set actor value and EVP to get them to walk
		;if GetActorRef() != Game.GetPlayer() 
			GetActorRef().SetActorValue("Variable01", 1)
			GetActorRef().EvaluatePackage()
		;endif
	endif
endEvent


int Property stageOnExit  Auto  
{which stage to set when I'm done}
