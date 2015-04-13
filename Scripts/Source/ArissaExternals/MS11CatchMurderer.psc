Scriptname MS11CatchMurderer extends ObjectReference  
{Eventually this will be a radiantly triggered scene where the player stumbles upon Calixto about to commit the murder. Right now this is just a hack that teleports him to the appropriate spot and sets the new quest stage. }

Quest Property ms11 Auto
ReferenceAlias Property Calixto Auto

Faction Property CrimeFaction auto
Faction Property TownFaction auto
Faction Property NullFaction auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (ms11.IsRunning() && (ms11.GetStage() == 120))
			Actor calixtoActor = Calixto.GetActorReference()
			; I hate that I have to do this
			calixtoActor.AddToFaction(NullFaction)
			calixtoActor.SetCrimeFaction(NullFaction)
			
			calixtoActor.RemoveFromFaction(CrimeFaction)
			calixtoActor.RemoveFromFaction(TownFaction)
			ms11.SetStage(130)
			; Debug.MessageBox("You catch the murderer and stop him from killing another innocent. He gives chase!")
			Delete()
		endif
	endif
endEvent
