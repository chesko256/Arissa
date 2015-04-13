Scriptname MS11CheatStalkTriggerScript extends ObjectReference  

Quest Property MS11 auto
Scene Property MS11KillScene auto

ReferenceAlias Property Calixto auto
ReferenceAlias Property Victim auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && (MS11 as MS11QuestScript).SiegeOfWindhelmTakingPlace == False)
		if (MS11KillScene.IsPlaying())
			Calixto.GetActorReference().MoveToPackageLocation()
			Victim.GetActorReference().MoveToPackageLocation()
		endif
	endif
EndEvent
