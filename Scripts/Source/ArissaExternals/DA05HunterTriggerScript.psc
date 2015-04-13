Scriptname DA05HunterTriggerScript extends ObjectReference  

ReferenceAlias Property Hunter1 Auto
ReferenceAlias Property Hunter2 Auto

Quest Property DA05 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (DA05.GetStage() > 50)
		string report
		if (Hunter2 != NONE)
			report = "Sinding leaps out of the shadows and disables the hunters before disappearing again."
		else
			report = "Sinding leaps out of the shadows and disables the hunter before disappearing again."
		endif
		; Debug.MessageBox(report)

		Hunter1.GetActorReference().DamageActorValue("health", 99999)
		Hunter2.GetActorReference().DamageActorValue("health", 99999)
	endif
endEvent
