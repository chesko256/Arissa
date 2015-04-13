Scriptname T03EldergleamEntranceScript extends ObjectReference  

Quest Property t03 Auto
ReferenceAlias Property maurice Auto

Event OnTriggerEnter(ObjectReference akActionRef) 
	if (akActionRef == Game.GetPlayer())
		T03QuestScript t03script = t03 as T03QuestScript
		if ( (t03.GetStage() == 40) && (t03script.MauriceShouldFollow) && (!maurice.GetActorReference().IsDead()) )
			maurice.GetReference().MoveTo(Game.GetPlayer())
			Disable()
		endif
	endif
endEvent
