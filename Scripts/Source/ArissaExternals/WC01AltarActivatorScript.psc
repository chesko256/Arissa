Scriptname WC01AltarActivatorScript extends ReferenceAlias  

ReferenceAlias Property Victim auto
Faction Property SafeCorpse auto

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		Victim.GetActorRef().AddToFaction(SafeCorpse)
		Victim.GetActorRef().Kill()
		GetOwningQuest().SetStage(100)
	endif
endEvent